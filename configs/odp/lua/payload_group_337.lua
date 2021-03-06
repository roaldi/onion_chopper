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
detection_name: Payload Group "337"
version: 1
description: Group of payload detectors.
bundle_description: $VAR1 = {
          'Battle.net' => 'Game networking service.'
        };

--]]

require "DetectorCommon"

local DC = DetectorCommon

DetectorPackageInfo = {
    name =  "payload_group_337",
    proto =  DC.ipproto.tcp,
    client = {
        init =  'DetectorInit',
        clean =  'DetectorClean',
        minimum_matches =  1
    }
}

gUrlPatternList = {

    -- Battle.net
    { 0, 0, 0, 1941, 20, "bnetcmsus-a.akamaihd.net", "/", "http:", "", 564},
    { 0, 0, 0, 1941, 20, "bnetcmskr-a.akamaihd.net", "/", "http:", "", 564},
    { 0, 0, 0, 1941, 20, "bnetcmseu-a.akamaihd.net", "/", "http:", "", 564},
    { 0, 0, 0, 1941, 20, "bnetus-a.akamaihd.net", "/", "http:", "", 564},
    { 0, 0, 0, 1941, 20, "bneteu-a.akamaihd.net", "/", "http:", "", 564},
    { 0, 0, 0, 1941, 20, "bnetkr-a.akamaihd.net", "/", "http:", "", 564},
    { 0, 0, 0, 1941, 20, "bnetshopus.akamaized.net", "/", "http:", "", 564},
    { 0, 0, 0, 1941, 20, "bnetshopeu.akamaized.net", "/", "http:", "", 564},
    { 0, 0, 0, 1941, 20, "bnetshopkr.akamaized.net", "/", "http:", "", 564},
    { 0, 0, 0, 1941, 20, "battlenet.com.cn", "/", "http:", "", 564},
    { 0, 0, 0, 1941, 20, "bnetproduct-a.akamaihd.net", "/", "http:", "", 564},

}

function DetectorInit(detectorInstance)

    gDetector = detectorInstance;

    if gDetector.addAppUrl then
        for i,v in ipairs(gUrlPatternList) do
            gDetector:addAppUrl(v[1],v[2],v[3],v[4],v[5],v[6],v[7],v[8],v[9],v[10]);
        end
    end

    return gDetector;
end

function DetectorClean()
end

