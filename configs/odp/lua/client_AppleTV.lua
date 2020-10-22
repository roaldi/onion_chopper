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
detection_name: Apple TV
description: Apple device to receive the media traffics from Internet or Local networks.
--]]

require "DetectorCommon"

local DC = DetectorCommon

DetectorPackageInfo = {
    name =  "AppleTV",
    proto =  DC.ipproto.tcp,
    client = {
        init =  'DetectorInit',
        clean =  'DetectorClean',
        validate =  'DetectorValidator',
        minimum_matches =  1
    }
}

function DetectorClean()
end

function DetectorInit(detectorInstance)
    gDetector = detectorInstance
    gDetector:addHttpPattern(2, 5, 0, 215, 1, 0, 0, 'AirPlay', 1681, 1);
    gDetector:addHttpPattern(2, 5, 0, 216, 1, 0, 0, 'iTunes-AppleTV', 1683, 1);
    gDetector:addHttpPattern(2, 5, 0, 216, 1, 0, 0, 'AppleTV3,1', 1683, 1);
    gDetector:addHttpPattern(2, 5, 0, 216, 1, 0, 0, 'AppleTV', 1683, 1);  
	gDetector:addHttpPattern(2, 5, 0, 216, 1, 0, 0, 'Apple TV', 1683, 1);
    return gDetector
end

function DetectorValidator()
    local context = {}
    return clientFail(context)
end

function DetectorFini()
end
