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
detection_name: Payload Group "333"
version: 1
description: Group of payload detectors.
bundle_description: $VAR1 = {
          'Amp' => 'AMP is a web component framework and a website publishing technology',
          'DepartApp' => 'Platform for measurement, collection, analysis and reporting of web data',
          'TAFE NSW' => 'TAFE NSW is Australia\'s leading provider for education and training courses',
          'Microsoft Teams' => 'Microsoft Teams is a unified communication and collaboration platform for workplace communication exchange',
          'Twinkl' => 'Official website for Twinkl educational resources',
          'NrData' => 'Category B ISP',
          'Ballina Beach Village' => 'Website for a vacation resort where you can book and plan your trip to them',
          'Zerodha' => 'Financial services company with a focus on online stock brokerage.',
          'Windscribe' => 'VPN traffic generated by Windscribe.'
        };

--]]

require "DetectorCommon"

local DC = DetectorCommon

DetectorPackageInfo = {
    name =  "payload_group_333",
    proto =  DC.ipproto.tcp,
    client = {
        init =  'DetectorInit',
        clean =  'DetectorClean',
        minimum_matches =  1
    }
}

gUrlPatternList = {

    -- Microsoft teams
    { 0, 0, 0, 1800, 8, "teams.microsoft.com", "/", "http:", "", 4616},
    -- Amp
    { 0, 0, 0, 1922, 19, "amp.dev", "/", "http:", "", 4603},
    { 0, 0, 0, 1922, 19, "ampproject.org", "/", "http:", "", 4603},
    -- NrData
    { 0, 0, 0, 1923, 15, "nrdata.net", "/", "http:", "", 4607},
    -- Twinkl
    { 0, 0, 0, 1924, 12, "twinkl.com", "/", "http:", "", 4608},
    { 0, 0, 0, 1924, 12, "twinkl.co.uk", "/", "http:", "", 4608},
    -- Zerodha
    { 0, 0, 0, 1928, 41, "zerodha.com", "/", "http:", "", 4609},
    -- Ballina Beach Village
    { 0, 0, 0, 1925, 37, "ballinabeachvillage.com.au", "/", "http:", "", 4610},
    -- TAFE NSW
    { 0, 0, 0, 1926, 12, "tafensw.edu.au", "/", "http:", "", 4611},
    -- DepartApp
    { 0, 0, 0, 1927, 16, "departapp.com", "/", "http:", "", 4613},
    -- Windscribe
    { 0, 0, 0, 1929, 46, "windscribe.com", "/", "http:", "", 4541},

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
