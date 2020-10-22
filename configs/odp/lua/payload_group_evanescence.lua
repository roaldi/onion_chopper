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
detection_name: Payload Group "evanescence"
version: 10
description: Group of payload detectors.
bundle_description: $VAR1 = {
          'Office Mobile' => 'Microsoft productivty apps for use on Android devices.',
          'Messenger' => 'Facebook\'s standalone messenger app.',
          'Office 365' => 'Traffic generated by MS Office 365 applications and web services.',
          'Exchange Online' => 'Traffic associated with Exchange Online, such as visiting outlook.com.',
          'Office 365 Planner' => 'Microsoft online calendar.',
          'Sway' => 'Microsoft collaboration tool.'
        };

--]]

require "DetectorCommon"



local DC = DetectorCommon

DetectorPackageInfo = {
    name =  "payload_group_evanescence",
    proto =  DC.ipproto.tcp,
    client = {
        init =  'DetectorInit',
        clean =  'DetectorClean',
        minimum_matches =  1
    }
}

gUrlPatternList = {
    -- Ofice 365
    { 0, 0, 0, 1378, 5, "Portal.Office.com", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "Home.Office.com", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "office365.com", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "office.com", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "office.net", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "microsoftonline.com", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "onmicrosoft.com", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "glbdns.microsoft.com", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "login.windows.net", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "login.microsoftonline.com", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "office365servicehealthcommunications.cloudapp.net", "/", "http:", "", 2812},    
    { 0, 0, 0, 1378, 5, "prod.msocdn.com", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "office.microsoft.com", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "testconnectivity.microsoft.com", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "testexchangeconnectivity.com", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "client.hip.live.com", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "wu.client.hip.live.com", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "support.microsoft.com", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "activation.sls.microsoft.com", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "crl.microsoft.com", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "odc.officeapps.live.com", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "clientconfig.microsoftonline-p.net", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "ols.officeapps.live.com", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "office15client.microsoft.com", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "officecdn.microsoft.com", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "officeapps.live.com", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "cdn.office.net", "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "nexus.officeapps.live.com",  "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "officehome.msocdn.com",  "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "scuofficehome.msocdn.com",  "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "eusofficehome.msocdn.com",  "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "seaofficehome.msocdn.com",  "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "officeppe.com",  "/", "http:", "", 2812},
    { 0, 0, 0, 1378, 5, "officecdn-microsoft-com.akamaized.net",  "/", "http:", "", 2812},
    -- Exchange Online
    { 0, 0, 0, 1847, 22, "r3.res.outlook.com", "/", "http:", "", 2810},
    { 0, 0, 0, 1847, 22, "res.outlook.com", "/", "http:", "", 2810},
    { 0, 0, 0, 1847, 22, "outlook.com", "/", "http:", "", 2810},
    { 0, 0, 0, 1847, 22, "pop3.live.com", "/", "http:", "", 2810},
    { 0, 0, 0, 1847, 22, "r1.res.office365.com", "/", "http:", "", 2810},
    { 0, 0, 0, 1847, 22, "r3.res.office365.com", "/", "http:", "", 2810},
    { 0, 0, 0, 1847, 22, "r4.res.office365.com", "/", "http:", "", 2810},
    { 0, 0, 0, 1847, 22, "hybridconfiguration.azurewebsites.net", "/", "http:", "", 2810},
    -- Sway
    { 0, 0, 0, 1848, 22, "sway.com", "/", "http:", "", 4069},
    { 0, 0, 0, 1848, 22, "www.sway.com", "/", "http:", "", 4069},
    { 0, 0, 0, 1848, 22, "eus-www.sway.com", "/", "http:", "", 4069},
    { 0, 0, 0, 1848, 22, "wus-www.sway.com", "/", "http:", "", 4069},
    { 0, 0, 0, 1848, 22, "eus-www.sway-cdn.com", "/", "http:", "", 4069},
    { 0, 0, 0, 1848, 22, "wus-www.sway-cdn.com", "/", "http:", "", 4069},
    { 0, 0, 0, 1848, 22, "eus-www.sway-extensions.com", "/", "http:", "", 4069},
    { 0, 0, 0, 1848, 22, "wus-www.sway-extensions.com", "/", "http:", "", 4069},
    { 0, 0, 0, 1848, 22, "c.microsoft.com", "/", "http:", "", 4069},
    { 0, 0, 0, 1848, 22, "c1.microsoft.com", "/", "http:", "", 4069},
    -- Planner
    { 0, 0, 0, 1849, 22, "tasks.office.com",  "/", "http:", "", 4070},
    { 0, 0, 0, 1849, 22, "controls.office.com",  "/", "http:", "", 4070},
    { 0, 0, 0, 1849, 22, "tasks.osi.office.net",  "/", "http:", "", 4070},
    { 0, 0, 0, 1849, 22, "clientlog.portal.office.com",  "/", "http:", "", 4070},
    -- Office for iPad
    -- { 0, 0, 0, 1850, 22, "directory.services.live.com",  "/", "http:", "", 4071},
    -- { 0, 0, 0, 1850, 22, "nexus.officeapps.live.com",  "/", "http:", "", 4071},
    -- { 0, 0, 0, 1850, 22, "dc2.client.hip.live.com",  "/", "http:", "", 4071},
    -- { 0, 0, 0, 1850, 22, "c.live.com",  "/", "http:", "", 4071},
    -- { 0, 0, 0, 1850, 22, "docs.live.net",  "/", "http:", "", 4071},
    -- { 0, 0, 0, 1850, 22, "sqm.microsoft.com",  "/", "http:", "", 4071},
    -- { 0, 0, 0, 1850, 22, "watson.telemetry.microsoft.com",  "/", "http:", "", 4071},
    -- { 0, 0, 0, 1850, 22, "sas.office.microsoft.com",  "/", "http:", "", 4071},
    -- { 0, 0, 0, 1850, 22, "p100-sandbox.itunes.apple.com",  "/", "http:", "", 4071},
    -- { 0, 0, 0, 1850, 22, "cl2.apple.com",  "/", "http:", "", 4071},
    -- { 0, 0, 0, 1850, 22, "view.atdmt.com",  "/", "http:", "", 4071},
    -- { 0, 0, 0, 1850, 22, "c.bing.com",  "/", "http:", "", 4071},
    -- { 0, 0, 0, 1850, 22, "foodanddrink.services.appex.bing.com",  "/", "http:", "", 4071},
    -- { 0, 0, 0, 1850, 22, "weather.tile.appex.bing.com",  "/", "http:", "", 4071},
    -- { 0, 0, 0, 1850, 22, "partnerservices.getmicrosoftkey.com",  "/", "http:", "", 4071},
    -- { 0, 0, 0, 1850, 22, "en-US.appex-rf.msn.com",  "/", "http:", "", 4071},
    -- Office Mobile
    { 0, 0, 0, 1851, 22, "roaming.officeapps.live.com",  "/", "http:", "", 4072},
    { 0, 0, 0, 1851, 22, "d.docs.live.net",  "/", "http:", "", 4072},
    { 0, 0, 0, 1851, 22, "odcsm.officeapps.live.com",  "/", "http:", "", 4072},
    { 0, 0, 0, 1851, 22, "wer.microsoft.com",  "/", "http:", "", 4072},
    { 0, 0, 0, 1851, 22, "msft.sts.microsoft.com",  "/", "http:", "", 4072},
    { 0, 0, 0, 1851, 22, "microsoft-my.sharepoint.com",  "/", "http:", "", 4072},
    { 0, 0, 0, 1851, 22, "ms.tific.com",  "/", "http:", "", 4072},
    { 0, 0, 0, 1851, 22, "auth.gfx.ms",  "/", "http:", "", 4072},
    { 0, 0, 0, 1851, 22, "officeimg.vo.msecnd.net",  "/", "http:", "", 4072},
    { 0, 0, 0, 1851, 22, "appex.bing.com",  "/", "http:", "", 4072},
    { 0, 0, 0, 1851, 22, "appex-rf.msn.com",  "/", "http:", "", 4072},
    { 0, 0, 0, 1851, 22, "appexsin.stb.s-msn.com",  "/", "http:", "", 4072},
    -- Messenger
    { 0, 0, 0, 1852, 10, "messenger.com", "/", "http:", "", 4073},
    { 0, 0, 0, 1852, 10, "chat.messenger.com", "/pull?channel", "http:", "", 4073},
    { 0, 0, 0, 1852, 10, "messenger.com", "/t", "http:", "", 4073},
    { 0, 0, 0, 1852, 10, "messenger.com", "/ajax/mercury/send_messages", "http:", "", 4073},
    { 0, 0, 0, 1852, 10, "messenger.com", "/ajax/messaging", "http:", "", 4073},
    { 0, 0, 0, 1852, 10, "messenger.com", "/ajax/bz", "http:", "", 4073},
    { 0, 0, 0, 1852, 10, "messenger.com", "/rtc/callability", "http:", "", 4073},
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
