--[[
# Copyright 2001-2014 Cisco Systems, Inc. and/or its affiliates. All rights
# reserved.
#
# This file contains proprietary Detector Content created by Cisco Systems,
# Inc. or its affiliates ("Cisco") and is distributed under the GNU General
# Public License, v2 (the "GPL").  This file may also include Detector Content
# contributed by third parties. Third party contributors are identified in the
# "authors" file.  The Detector Content created by Cisco is owned by, and
# remains the property of, Cisco.  Detector Content from third party
# contributors is owned by, and remains the property of, such third parties and
# is distributed under the GPL.  The term "Detector Content" means specifically
# formulated patterns and logic to identify applications based on network
# traffic characteristics, comprised of instructions in source code or object
# code form (including the structure, sequence, organization, and syntax
# thereof), and all documentation related thereto that have been officially
# approved by Cisco.  Modifications are considered part of the Detector
# Content.
--]]
--[[
detection_name: Paltalk File Transfer
version: 4
description: Paltalk peer to peer file transfer.
--]]

require "DetectorCommon"

--require('debugger')

--local DC = require("DetectorCommon")
local DC = DetectorCommon
local HT = hostServiceTrackerModule
local FT = flowTrackerModule

DetectorPackageInfo = {
    name =  "Paltalk File Transfer",
    proto =  DC.ipproto.tcp,
    server = {
        init =  'DetectorInit',
        validate =  'DetectorValidator',
    }
}

gServiceId = 20195 
gServiceName = 'Paltalk File Transfer'
gSfAppIdPtalkTransfer = 1101

--patterns used in DetectorInit()
gPatterns = {       
    --patternName        Pattern                                  offset
    --------------------------------------------------------------------
    srv      = {'\067\079\078\078\069\067\084\009\079\075\010', 0, gSfAppIdPtalkTransfer},
    cli      = {'\073\078\084\082\079\009\055\054\056\053\050\053', 0, gSfAppIdPtalkTransfer},
}

--fast pattern registerd with core engine - needed when not using CSD tables
gFastPatterns = {
    --protocol       patternName
    ------------------------------------
    {DC.ipproto.tcp, gPatterns.srv},
}

gAppRegistry = {
	--AppIdValue          Extracts Info
	---------------------------------------
	{gSfAppIdPtalkTransfer,		         0}
}

function serviceInProcess(context)

    local flowFlag = context.detectorFlow:getFlowFlag(DC.flowFlags.serviceDetected)

    if ((not flowFlag) or (flowFlag == 0)) then
        gDetector:inProcessService()
    end

    DC.printf('%s: Inprocess, packetCount: %d\n', gServiceName, context.packetCount);
    return DC.serviceStatus.inProcess
end

function serviceSuccess(context)
    local flowFlag = context.detectorFlow:getFlowFlag(DC.flowFlags.serviceDetected)

    if ((not flowFlag) or (flowFlag == 0)) then
        gDetector:addService(gServiceId, "", "", gSfAppIdPtalkTransfer)
    end

    DC.printf('%s: Detected, packetCount: %d\n', gServiceName, context.packetCount);
    return DC.serviceStatus.success
end

function serviceFail(context)
    local flowFlag = context.detectorFlow:getFlowFlag(DC.flowFlags.serviceDetected)

    if ((not flowFlag) or (flowFlag == 0)) then
        gDetector:failService()
    end

    context.detectorFlow:clearFlowFlag(DC.flowFlags.continue)
    DC.printf('%s: Failed, packetCount: %d\n', gServiceName, context.packetCount);
    return DC.serviceStatus.nomatch
end

function registerPortsPatterns()

    --register pattern based detection
    for i,v in ipairs(gFastPatterns) do
        if ( gDetector:registerPattern(v[1], v[2][1], #v[2][1], v[2][2], v[2][3]) ~= 0) then
            DC.printf ('Paltalk transfer: register pattern failed for ')
        else
            DC.printf ('Paltalk transfer: register pattern successful for ')
        end
    end

	for i,v in ipairs(gAppRegistry) do
		pcall(function () gDetector:registerAppId(v[1],v[2]) end)
	end

end


--[[ Core engine calls DetectorInit() to initialize a detector.
--]]
function DetectorInit( detectorInstance)

    gDetector = detectorInstance
    DC.printf('%s: DetectorInit()\n',gServiceName)

    gDetector:init(gServiceName, 'DetectorValidator', 'DetectorFini')
    registerPortsPatterns()
    DC.printf('done with init');
    return gDetector
end


--[[Validator function registered in DetectorInit()

    (1+dir) and (2-dir) logic takes care of symmetric request response case. Once connection is established,
    client (server) can send request and server (client) should send a response.
--]]
function DetectorValidator()
    local context = {}
    context.detectorFlow = gDetector:getFlow()
    context.packetDataLen = gDetector:getPacketSize()
    context.packetDir = gDetector:getPacketDir()
    context.srcIp = gDetector:getPktSrcAddr()
    context.dstIp = gDetector:getPktDstAddr()
    context.srcPort = gDetector:getPktSrcPort()
    context.dstPort = gDetector:getPktDstPort()
    context.flowKey = context.detectorFlow:getFlowKey()
    context.packetCount = gDetector:getPktCount()
    local size = context.packetDataLen
    local dir = context.packetDir
    local srcPort = context.srcPort
    local dstPort = context.dstPort
    local flowKey = context.flowKey
    local rft = FT.getFlowTracker(flowKey)
    DC.printf ('%s:DetectorValidator(): packetCount %d, dir %d\n', gServiceName, context.packetCount, dir);
    if (size == 0) then
        return serviceInProcess(context)
    end

    DC.printf ('%s:DetectorValidator(): packetCount %d, dir %d\n', gServiceName, context.packetCount, dir);

    if (not rft) then
        rft = FT.addFlowTracker(flowKey, {server_received=0})
    end

    if (dir == 1 and 
        rft.server_received == 0 and 
        gDetector:memcmp(gPatterns.srv[1], #gPatterns.srv[1], gPatterns.srv[2]) == 0 
        and size >=11 )  then
        rft.server_received = 1
        return serviceInProcess(context)
    end

    if (dir == 0 and 
        rft.server_received == 1 and
        gDetector:memcmp(gPatterns.cli[1], #gPatterns.cli[1], gPatterns.cli[2]) == 0 and
        size >= 21 ) then 
        FT.delFlowTracker(flowKey)
        return serviceSuccess(context)    
    end

    FT.delFlowTracker(flowKey)
    return serviceFail(context)
end

--[[Required DetectorFini function
--]]
function DetectorFini()
    --print (gServiceName .. ': DetectorFini()')
end
