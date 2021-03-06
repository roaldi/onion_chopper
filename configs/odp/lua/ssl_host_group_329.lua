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
detection_name: SSL Group "329"
version: 1
description: Group of SSL Host detectors.
bundle_description: $VAR1 = {
          'Walmart' => 'Discount department store.',
          'CNN.com' => 'Turner Broadcasting System\'s news website.',
          'Amazon' => 'Online retailer of books and most other goods.'
        };

--]]

require "DetectorCommon"

local DC = DetectorCommon

DetectorPackageInfo = {
    name =  "ssl_host_group_329",
    proto =  DC.ipproto.tcp,
    client = {
        init =  'DetectorInit',
        clean =  'DetectorClean',
        minimum_matches =  1
    }
}

gSSLHostPatternList = {

    -- cnn.com
    { 0, 1190, 'cnn.com' },
    { 0, 1190, 'cnn.sdk.beemray.com' },
    -- Walmart
    { 0, 901, 'walmart.com' },
    { 0, 901, 'walmart.ca' },
    -- Amazon
    { 0, 24, 'amazon.com' },
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
