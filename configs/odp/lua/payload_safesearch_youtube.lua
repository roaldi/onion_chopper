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
detection_name: YouTube
version: 8
description: A video-sharing website on which users can upload, share, and view videos.
bundle_description: $VAR1 = {
          'YouTube' => 'A video-sharing website on which users can upload, share, and view videos.'
        };

--]]

require "DetectorCommon"


local DC = DetectorCommon

DetectorPackageInfo = {
    name =  "youtube Safesearch",
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
    if (gDetector.CHPMultiCreateApp and gDetector.CHPMultiAddAction) then
        local handle = gDetector:CHPMultiCreateApp(929, 4, 0);
        gDetector:CHPMultiAddAction(handle, 1, 1, "www.youtube.", 13, "");
        -- replace the unsafe COOKIE parameter
        gDetector:CHPMultiAddAction(handle, 0, 4, "f2=8000000", 4, ""); -- already present, preempt insert below
        gDetector:CHPMultiAddAction(handle, 0, 4, "PREF=", 4, "f2=8000000&");
    end
    return gDetector
end

function DetectorValidator()
    local context = {}
    return serviceFail(context)
end

function DetectorFini()
end
