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
detection_name: Payload Group "Yo Yo Ma"
version: 5
description: Group of payload detectors.
bundle_description: $VAR1 = {
          'Web.de' => 'German free email and cloud storage service.',
          'OneDrive' => 'Microsoft cloud storage offering, successor to SkyDrive.',
          'Yahoo! Douga' => 'Yahoo! Japan video streaming site.',
          'Workday' => 'Software as Service solutions provider.',
          'ServiceNow' => 'Cloud storage provider.',
          'T-Online' => 'German free email and cloud storage service.',
          'QQ Games' => 'Multi-Player online game by QQ.',
          'Google Talk Gadget' => 'Flash based Google Talk IM client.',
          'Rackspace' => 'Virtual and physical server hosting providers.',
          'Yahoo! Box' => 'Yahoo! Japan cloud storage service.',
          'LinkedIn Contacts' => 'LinkedIn application for networking with contacts.',
          'Yik Yak' => 'Mobile app to share/comment on post, like local buttetin board.',
          'easyMule' => 'Open-Source P2P software.'
        };

--]]

require "DetectorCommon"


local DC = DetectorCommon

DetectorPackageInfo = {
    name =  "payload_group_yoyoma",
    proto =  DC.ipproto.tcp,
    client = {
        init =  'DetectorInit',
        clean =  'DetectorClean',
        minimum_matches =  1
    }
}

gUrlPatternList = {
     -- easyMule
    { 0, 0, 0, 1371, 22, "easymule.com", "/", "http:", "", 3728},
    -- Yik Yak
    { 0, 0, 0, 1372, 22, "yikyakapp.com", "/", "http:", "", 3730},
    -- OneDrive
    { 0, 0, 0, 1377, 9, "onedrive.live.com", "/", "http:", "", 3735},
    -- LinkedIn Contacts
    { 0, 0, 0, 1379, 5, "contacts.linkedin.com", "/", "http:", "", 3736},
    -- Rackspace
    { 0, 0, 0, 1380, 9, "rackspace.com", "/", "http:", "", 3737},
    -- ServiceNow
    { 0, 0, 0, 1381, 9, "servicenow.com", "/", "http;", "", 3738},
    -- T-Online
    { 0, 0, 0, 1382, 4, "t-online.de", "/", "http:", "", 3739},
    -- Web-de
    { 0, 0, 0, 1383, 4, "web.de", "/", "http:", "", 3740},
    -- Workday
    { 0, 0, 0, 1384, 9, "workday.com", "/", "http:", "", 3741},
    -- y! douga
    { 0, 0, 0, 1385, 19, "streaming.yahoo.co.jp", "/", "http:", "", 3756},
    -- y! box
    { 0, 0, 0, 1386, 9, "box.yahoo.co.jp", "/", "http:", "", 3757},
    
}

function DetectorInit(detectorInstance)

    gDetector = detectorInstance;

    -- google talk gadget
    gDetector:addHttpPattern(2, 5, 0, 460, 16, 0, 0, 'gtalkplugin', 182, 1);
    -- QQ Games 
    gDetector:addHttpPattern(2, 5, 0, 454, 20, 0, 0, 'QQGame', 3727, 1);
    -- Yik Yak
    gDetector:addHttpPattern(2, 5, 0, 470, 16, 0, 0, 'Yik%20Yak', 3730, 1);


    if gDetector.addAppUrl then
        for i,v in ipairs(gUrlPatternList) do
            gDetector:addAppUrl(v[1],v[2],v[3],v[4],v[5],v[6],v[7],v[8],v[9],v[10]);
        end
    end

    return gDetector;
end

function DetectorClean()
end

