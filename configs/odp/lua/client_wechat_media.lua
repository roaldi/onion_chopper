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
detection_name: WeChat media
version: 2
description: Media transfer via WeChat/
--]]

require "DetectorCommon"


local DC = DetectorCommon

DetectorPackageInfo = {
    name =  "WeChat media",
    proto =  DC.ipproto.tcp,
    client = {
        init =  'client_init',
        clean =  'client_clean',
        validate =  'client_validate',
        minimum_matches =  1
    }
}

gSfAppIdWeChatmedia = 2620

gPatterns = {
    first = {'weixinnum', 41, gSfAppIdWeChatmedia},
}

gWeChatmediaPatterns = {
    {DC.ipproto.tcp, gPatterns.first},
}

gAppRegistry = {
    --AppIdValue          Extracts Info
    ---------------------------------------
    {gSfAppIdWeChatmedia,                 0}
}

function clientInProcess(context)
    DC.printf('%s: Inprocess Client, packetCount: %d\n', DetectorPackageInfo.name, context.packetCount)
    return DC.clientStatus.inProcess
end

function clientSuccess(context)
    context.detectorFlow:setFlowFlag(DC.flowFlags.clientAppDetected)
    DC.printf('%s: Detected Client, packetCount: %d\n', DetectorPackageInfo.name, context.packetCount)
    gDetector:client_addApp(appServiceId, appTypeId, appProductId, '', gSfAppIdWeChatmedia);
    return DC.clientStatus.success
end

function clientFail(context)
    DC.printf('%s: Failed Client, packetCount: %d\n', DetectorPackageInfo.name, context.packetCount)
    return DC.clientStatus.einvalid
end

function client_clean()
end

function client_init(detectorInstance)
    gDetector = detectorInstance

    DC.printf ('%s:client_init()\n', DetectorPackageInfo.name);
    gDetector:client_init()
    appTypeId = 16
    appProductId = 539
    appServiceId = 20208
    DC.printf ('%s:client_validate(): appTypeId %d, product %d, service %d\n', DetectorPackageInfo.name, appTypeId, appProductId, appServiceId)

    --register pattern based detection
    for i,v in ipairs(gWeChatmediaPatterns) do
        if ( gDetector:client_registerPattern(v[1], v[2][1], #v[2][1], v[2][2], v[2][3]) ~= 0) then
            DC.printf ('%s: register pattern failed for %s\n', DetectorPackageInfo.name,v[2][1])
        else
            DC.printf ('%s: register pattern successful for %s\n', DetectorPackageInfo.name,v[2][1])
        end
    end

    for i,v in ipairs(gAppRegistry) do
        pcall(function () gDetector:registerAppId(v[1],v[2]) end)
    end

    return gDetector
end

function client_validate()
    local context = {}

    context.detectorFlow = gDetector:getFlow()
    context.packetCount = gDetector:getPktCount()
    context.packetDataLen = gDetector:getPacketSize()
    context.packetDir = gDetector:getPacketDir()
    context.flowKey = context.detectorFlow:getFlowKey()
    context.srcPort = gDetector:getPktSrcPort()
    context.dstPort = gDetector:getPktDstPort()
    local size = context.packetDataLen
    local dir = context.packetDir
    local srcPort = context.srcPort
    local dstPort = context.dstPort
    local flowKey = context.flowKey

    DC.printf ('WeChat media packetCount %d dir %d, size %d\n', context.packetCount, dir, size)
    if dir == 0 and ((gDetector:getPcreGroups("POST /upload") and gDetector:getPcreGroups("Content-Type: application/octet-stream")) or (gDetector:getPcreGroups("file"))) then
        DC.printf("WeChat media matched\n")
        return clientSuccess(context)
    end

    return clientInProcess(context)

end


function DetectorFini()
end
