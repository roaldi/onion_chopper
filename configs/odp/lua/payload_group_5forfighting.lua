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
detection_name: Payload Group "5forfighting"
version: 5
description: Group of payload detectors.
bundle_description: $VAR1 = {
          'Cisco Jabber' => 'Cisco\'s version of the Jabber XMPP client.',
          'Gmail attachment' => 'Downloading an attached file from Gmail.',
          'Info.com' => 'Search engine.'
        };

--]]

require "DetectorCommon"


local DC = DetectorCommon

DetectorPackageInfo = {
    name =  "payload_group_5forfighting",
    proto =  DC.ipproto.tcp,
    client = {
        init =  'DetectorInit',
        clean =  'DetectorClean',
        minimum_matches =  1
    }
}

gUrlPatternList = {

    -- Info.com
    { 0, 0, 0, 1656, 22, "info.com", "/", "http:", "", 3876 },

    -- gmail attachment
    { 0, 0, 0, 1657, 4, "mail-attachment.googleusercontent.com", "/", "http:", "", 3885 },
    { 0, 0, 0, 1657, 4, "mail.google.com", "/upload/drive", "http:", "", 3885},
}

gSipUserAgentPatternList = {

    -- Cisco Jabber
    { 3971, "", "CUCM" },
    { 3971, "", "Cisco-CSF" },
}

gDNSHostPatternList = {
    { 0, 3885, "mail-attachment.googleusercontent.com" },
}

function DetectorInit(detectorInstance)

    gDetector = detectorInstance;

    gDetector:addHttpPattern(2, 5, 0, 473, 16, 0, 0, 'Jabber/', 3971);

    if gDetector.addAppUrl then
        for i,v in ipairs(gUrlPatternList) do
            gDetector:addAppUrl(v[1],v[2],v[3],v[4],v[5],v[6],v[7],v[8],v[9],v[10]);
        end
    end

    if gDetector.addSipUserAgent then
        for i,v in ipairs(gSipUserAgentPatternList) do
            gDetector:addSipUserAgent(v[1],v[2],v[3]);
        end
    end

    if gDetector.addDNSHostPattern then
        for i,v in ipairs(gDNSHostPatternList) do
            gDetector:addDNSHostPattern(v[1],v[2],v[3]);
        end
    end

    return gDetector;
end

function DetectorClean()
end

