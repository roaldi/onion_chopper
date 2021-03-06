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
detection_name: SSL Group "Matchbox_Twenty"
version: 2
description: Group of SSL Host detectors.
bundle_description: $VAR1 = {
          'Power BI' => 'Microsoft Business analytics tools.',
          'NBC News' => 'NBCUniversal\'s news website.',
          'Uptobox' => 'File sharing web portal.',
          'Tus Files' => 'File upload/download site.'
        };

--]]

require "DetectorCommon"


local DC = DetectorCommon

DetectorPackageInfo = {
    name =  "ssl_host_group_matchbox_twenty",
    proto =  DC.ipproto.tcp,
    client = {
        init =  'DetectorInit',
        clean =  'DetectorClean',
        minimum_matches =  1
    }
}

--detectorType(0-> Web, 1->Client),  AppId, SSLPattern
gSSLHostPatternList = {

    --NBC News
    { 0, 1192, 'nbcnews.com'},
    { 0, 1192, 'msnbc.msn.com'},

    --Uptobox
    { 0, 4514, 'uptobox.com'},

    -- Tus Files
    { 0, 4515, 'tusfiles.net'},

    -- Power BI
    { 1, 4520, 'powerbi.com'},
    { 1, 4520, 'powerbi.microsoft.com'},
    { 1, 4520, 'powerbicdn.azureedge.net'},
    { 1, 4520, 'powerbigov.us'},
    { 1, 4520, 'powerbi.de'},
    { 1, 4520, 'powerbi.cn'},
}

function DetectorInit(detectorInstance)

    gDetector = detectorInstance;

    if gDetector.addSSLCertPattern then
        for i,v in ipairs(gSSLHostPatternList) do
            gDetector:addSSLCertPattern(v[1],v[2],v[3]);
        end
    end

    return gDetector;
end

function DetectorClean()
end
