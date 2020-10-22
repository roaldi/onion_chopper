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
detection_name: SSL Group "backstreetboys"
version: 13
description: Group of SSL Host detectors.
bundle_description: $VAR1 = {
          'TLVMedia' => 'Advertisement site.',
          'Google ads' => 'Google targeted advertising.',
          'Ligatus' => 'Advertising and analytics site.',
          'Webtrends' => 'Advertisement site.',
          'VPNReactor' => 'An anonymizer that obfuscates web usage.',
          '1000mercis' => 'Advertising and analytics site.',
          'Weebly' => 'Free, online website creation tool.',
          'McAfee' => 'McAfee Antivirus/Security software download and updates.',
          'Eset' => 'Eset Antivirus/Security software download and updates.',
          'Ybrant Digital' => 'Advertisement site.',
          'Windows Live' => 'A collection of Microsoft\'s online services.',
          'eXelate' => 'Advertisement site.',
          'FriendFeed' => 'FriendFeed is a real-time feed aggregator from social media sites.',
          'Zoho' => 'A Web- based online office suite containing word processing, spreadsheets, presentations, databases, note-taking, wikis, CRM, project management, invoicing and other applications developed by ZOHO Corporation.',
          'Freelancer' => 'Site for job listings for temporary work.',
          'Xanga' => 'A website that hosts weblogs, photoblogs, and social networking profiles.',
          'Evidon' => 'Advertisement site.',
          'Webcrawler' => 'A search engine.',
          'wikidot' => 'Site that provides wikis.',
          'Weborama' => 'Video ad site.',
          'Uploading.com' => 'File transfer website.',
          'The Internet Archive' => 'Internet content provider.',
          'GOMTV.net' => 'International video game news from the GOM network.',
          'Wordpress' => 'An online blogging community.',
          'Zanox' => 'Advertising and analytics site.',
          'LINE Games' => 'Games played using LINE.',
          'Hao123.com' => 'Chinese website for personalized local news.',
          'GOMTV.com' => 'Korean sports-related website.',
          'Xbox Live sites' => 'XBox Live related websites.',
          'Windows Phone sites' => 'Windows phone related websites.',
          'Gom VPN' => 'Browser plugin based VPN.',
          'Vibrant' => 'Advertisement site.',
          'goo.ne.jp' => 'Japanese web portal.',
          'Seterus' => 'Loan servicing company.',
          'Channel 4' => 'British based streaming television.',
          'ContextWeb' => 'Advertisement site.',
          'Surikate' => 'Ad site.',
          'Freewheel' => 'Advertisement site.',
          'Foursquare' => 'Location-based social networking.',
          'Webs' => 'Photo, video, and file sharing, and online marketplace.',
          'Piksel' => 'Video streaming service.',
          'XiTi' => 'Advertising and analytics site.',
          'Dotomi' => 'Advertisement site.',
          'CyberGhost VPN' => 'An anonymizer that obfuscates web usage.',
          'Wikispaces' => 'Wiki hosting site.',
          'Panda' => 'Panda Security Antivirus/Security software download and updates.',
          'Media6Degrees' => 'Advertisement site.',
          'TubeMogul' => 'Advertisement site.',
          'Xaxis' => 'Advertisement site.',
          'VoiceFive' => 'Advertisement site.',
          'Groupon' => 'Gift certificate website.'
        };

--]]

require "DetectorCommon"


local DC = DetectorCommon

DetectorPackageInfo = {
    name =  "ssl_host_group_backstreetboys",
    proto =  DC.ipproto.tcp,
    client = {
        init =  'DetectorInit',
        clean =  'DetectorClean',
        minimum_matches =  1
    }
}

--detectorType(0-> Web, 1->Client),  AppId, SSLPattern
gSSLHostPatternList = {
    --Groupon
    { 0, 2361, 'groupon.com' },
    { 0, 2361, 'grouponcdn.com' },
    --FriendFeed
    { 0, 164, 'friendfeed.com' },
    --Foursquare
    { 0, 2357, 'foursquare.com' },
    { 0, 2357, '4sqi.net' },
    --Freelancer
    { 0, 2483, 'f-cdn.com' },
    { 0, 2483, 'freelancer.ca' },
    { 0, 2483, 'freelancer.com' },
    { 0, 2483, 'freelancer.cl' },
    { 0, 2483, 'freelancer.co.id' },
    { 0, 2483, 'freelancer.co.nz' },
    { 0, 2483, 'freelancer.co.za' },
    { 0, 2483, 'freelancer.com.au' },
    { 0, 2483, 'freelancer.com.bd' },
    { 0, 2483, 'freelancer.com.es' },
    { 0, 2483, 'freelancer.com.jm' },
    { 0, 2483, 'freelancer.com.pe' },
    { 0, 2483, 'freelancer.de' },
    { 0, 2483, 'freelancer.ec' },
    --Hao123.com
    { 0, 2855, 'hao123.com' },
    --wikidot
    { 0, 2352, 'wikidot.com'},
    { 0, 2352, 'wdfiles.com'},
    --Ybrant Digital
    { 0, 2546, 'lycos.com'},
    { 0, 2546, 'lycostv.com'},
    --Xanga
    { 0, 510, 'xanga.com'},
    --Weebly
    { 0, 1181, 'weebly.com'},
    --Zoho
    { 0, 528, 'zoho.com'},
    { 0, 528, 'zohostatic.com'},
    { 0, 528, 'zohospotlight.com'},
    { 0, 528, 'zohopublic.com'},
    --Wordpress
    { 0, 506, 'wordpress.com'},
    { 0, 506, 'wp.com'},
    --goo.ne.jp
    { 0, 1216, 'goo.ne.jp'},
    --ContextWeb
    { 0, 2571, 'contextweb.com'},
    --Dotomi
    { 0, 2515, 'dotomi.com'},
    --TubeMogul
    { 0, 2534, 'tubemogul.com'},
    --Webs
    { 0, 1228, 'webs.com'},
    { 0, 1228, 'websimages.com'},
    --The Internet Archive
    { 0, 2358, 'archive.org'},
    --Uploading.com
    { 0, 2366, 'uploading.com'},
    --VoiceFive
    { 0, 2584, 'voicefive.com'},
    --Vibrant
    { 0, 2519, 'vibrantmedia.com'},
    --TLVMedia
    { 0, 2536, 'tlvmedia.com'},
    --Media6Degrees
    { 0, 2522, 'media6degrees.com'},
    --eXelate
    { 0, 2517, 'exelator.com'},
    --Evidon
    { 0, 2510, 'evidon.com'},
    --Wikispaces
    { 0, 2488, 'wikispaces.com'},
    { 0, 2488, 'wikispaces.net'},
    --Webtrends
    { 0, 2587, 'webtrends.com'},
    { 0, 2587, 'webtrendslive.com'},
    --Xaxis
    { 0, 2541, 'xaxis.com'},
    --Piksel
    { 0, 3716, 'piksel.com'},
    --Ligatus
    { 0, 3712, 'ligatus.com'},
    { 0, 3712, 'ligatus.ch'},
    { 0, 3712, 'ligatus.at'},
    { 0, 3712, 'ligatus.es'},
    { 0, 3712, 'ligatus.be'},
    { 0, 3712, 'ligatus.nl'},
    { 0, 3712, 'ligatus.it'},
    { 0, 3712, 'ligatus.fr'},
    { 0, 3712, 'ligatus.de'},
    --Surikate
    { 0, 3719, 'surikate.com'},
    --eNovance
    --{ 0, 2567, 'enovance.com'},
    --Zanox
    { 0, 3725, 'zanox.com'},
    { 0, 3725, 'zanox.softgarden.io'},
    --XiTi
    { 0, 3724, 'xiti.com'},
    --Weborama
    { 0, 3723, 'weborama.fr'},
    { 0, 3723, 'weborama.com'},
    --1000mercis
    { 0, 3715, '1000mercis.com'},
    --Google ads
    { 0, 2403, 'googleadservices.com'},
    --Channel 4
    { 0, 3811, 'c4assets.com'},
    { 0, 3811, 'channel4.com'},
    --Xbox Live sites
    { 0, 2626, 'xboxlive.com'},
    --Windows Phone sites
    { 0, 2627, 'windowsphone.com'},
    --Webcrawler
    { 0, 3911, 'webcrawler.com' },
    --Seterus
    { 0, 4017, 'seterus.com' },
    --Carbonite
    { 0, 1813, 'carbonite.com' },
    -- Gom
    { 1, 4028, 'gomcomm.com' },
    --Eset
    { 0, 143, 'eset.com'},
    --McAfee
    { 0, 280, 'mcafee.com'},
    --Panda
    { 0, 359, 'pandasecurity.com'},
    --Windows Live
    { 0, 502, 'live.com'},
    --LINE Games
    { 0, 3713, 'linegame.jp'},
    --CyberGhost VPN
    { 0, 3653, 'cyberghostvpn.com'},
    --VPNReactor
    { 0, 3652, 'vprsecure.com'},
    { 0, 3652, 'vpnreactor.com'},
    --GOMTV.com
    { 0, 2640, 'gomtv.com'},
    --GOMTV.net
    { 0, 2639, 'gomtv.net'},
    --Freewheel
    { 0, 2574, 'freewheel.tv'},
    { 0, 2574, 'freewheel.com'},
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

