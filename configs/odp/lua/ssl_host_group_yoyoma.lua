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
detection_name: SSL Group "Yo Yo Ma"
version: 8
description: Group of SSL Host detectors.
bundle_description: $VAR1 = {
          'Yahoo! Box' => 'Yahoo! Japan cloud storage service.',
          'ServiceNow' => 'Cloud storage provider.',
          'Web.de' => 'German free email and cloud storage service.',
          'LinkedIn Contacts' => 'LinkedIn application for networking with contacts.',
          'Workday' => 'Software as Service solutions provider.',
          'Yahoo! Douga' => 'Yahoo! Japan video streaming site.',
          'Rackspace' => 'Virtual and physical server hosting providers.',
          'Yik Yak' => 'Mobile app to share/comment on post, like local buttetin board.',
          'T-Online' => 'German free email and cloud storage service.',
          'OneDrive' => 'Microsoft cloud storage offering, successor to SkyDrive.',
          'Office 365' => 'Traffic generated by MS Office 365 applications and web services.',
          'WebEx Connect' => 'Logging into WebEx.'
        };

--]]

require "DetectorCommon"


local DC = DetectorCommon

DetectorPackageInfo = {
    name =  "ssl_host_group_yoyoma",
    proto =  DC.ipproto.tcp,
    client = {
        init =  'DetectorInit',
        clean =  'DetectorClean',
        minimum_matches =  1
    }
}

--detectorType(0-> Web, 1->Client),  AppId, SSLPattern
gSSLHostPatternList = {

    -- YikYak 
    { 1, 3730, 'yikyakapp.com' },
    { 1, 3730, 'yikyakapi.net' },
    -- OneDrive
    { 0, 3735, 'onedrive.live.com' },
    -- Office 365
    { 0, 2812, 'prod.msocdn.com' },
    { 0, 2812, 'office365.com' },
    { 0, 2812, 'officecdn-microsoft-com.akamaized.net' },
   -- { 0, 2812, 'portal.office.com' },
    { 0, 2812, 'home.office.com' },
    { 0, 2812, 'office.com' },
    { 0, 2812, 'office.net' },
    { 0, 2812, 'onmicrosoft.com' },
    { 0, 2812, 'glbdns.microsoft.com' },
    { 0, 2812, 'login.windows.net' },
    { 0, 2812, 'login.microsoftonline.com' },
    { 0, 2812, 'office.microsoft.com' },
    { 0, 2812, 'prod.msocdn.com' },
    { 0, 2812, 'testconnectivity.microsoft.com' },
    { 0, 2812, 'testexchangeconnectivity.com' },
    { 0, 2812, 'client.hip.live.com' },
    { 0, 2812, 'wu.client.hip.live.com' },
    { 0, 2812, 'support.microsoft.com' },
    { 0, 2812, 'activation.sls.microsoft.com' },
    { 0, 2812, 'crl.microsoft.com' },
    { 0, 2812, 'odc.officeapps.live.com' },
    { 0, 2812, 'clientconfig.microsoftonline-p.net' },
    { 0, 2812, 'ols.officeapps.live.com' },
    { 0, 2812, 'office15client.microsoft.com' },
    { 0, 2812, 'officecdn.microsoft.com' },
    { 0, 2812, 'officeapps.live.com' },
    { 0, 2812, 'cdn.office.net' },
    -- WebEx Connect
    { 0, 3726, 'webexconnect.com' },
    { 0, 3726, 'webexconnect.com' }, 
    -- LinkedIn Contacts
    { 0, 3736, 'platform.linkedin.com' },
    -- Rackspace
    { 0, 3737, 'my.rackspace.com' },
    -- ServiceNow
    { 0, 3738, 'www.servicenow.com' },
    -- T-Online
    { 0, 3739, 'tcmt.tonline.de' },
    { 0, 3739, 'tcmt.t-online.de' },
    { 0, 3739, 'tipi.api.t-online.de' },
    { 0, 3739, 't-online.de' },
    -- Web.de
    { 0, 3740, 'web.de' },
    { 0, 3740, 'registrierung.web.de' },
    -- Workday
    { 0, 3741, 'www.workday.com' },
    { 0, 3741, 'workday.com' },
    -- y! douga
    { 0, 3756, 'gw.gyao.yahooapis.jp' },
    -- y! box
    { 0, 3757, 'box.yahoo.co.jp' },
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

