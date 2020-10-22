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
detection_name: Payload Group "TMBG"
version: 14
description: Group of payload detectors.
bundle_description: $VAR1 = {
          'AhrefsBot' => 'Web crawler by Ahrefs, SEO tool for checking backlinks.',
          'JikeSpider' => 'Web crawler for Jike.com, chinese search engine.',
          'The Baltimore Sun' => 'Offcial website for the daily newspaper covering local and regional events in Baltimore.',
          'Pinboard' => 'Social bookmarking portal.',
          'AddThis Bot' => 'Web crawler by AddThis.',
          'KBS' => 'Korean Broadcasting Syste, radio station.',
          'Genieo' => 'Web portal adware site.',
          'Penultimate' => 'Handwriting app for iPad.',
          'The Escapist Magazine' => 'Online Magazine for Video game lovers.',
          'Feed43' => 'Online RSS feed converter.',
          'Southern Living' => 'Guide to Southern culture, recipes and travel.',
          'NetSight' => 'Network management software.',
          'Ando Media' => 'Metrics and analytics for Internet radio.',
          'Boxoh' => 'A site that aggregates shipment tracking from different shipping providers.',
          'INRIX' => 'Mobile app for Traffic related updates.',
          'Printer Pro Desktop' => 'Software to print using the printer connected to Mac.',
          'JonDo' => 'Anonymous surfing proxy and traffic generated by it.',
          'PDF Expert' => 'App for iPad to view and endit PDF files.',
          'GoodSync' => 'File transfer and synchronization service.',
          'Tiny Tiny RSS' => 'Open source news feed.',
          'Instapaper' => 'App to save wb pages for later use.',
          'Xiami.com' => 'Chinese online music website.',
          'Moat' => 'Ad search and analystics.',
          'Dr. Watson' => 'Application debugger.',
          'Break.com' => 'Web portal for sharing funny videos and pictures.',
          'Stitcher' => 'Internet radio for news and talk shows.',
          'IMTransferAgent' => 'Windows Azure storage used by iMessage.',
          'CNET Download' => 'Download of content from CNET.',
          'Realview TV' => 'Provides HD,3D videos to engage the website viewers.',
          'Hideman Login' => 'Logging into Hideman internet anonymizer.',
          'Pushover' => 'Push notification services.',
          'VEVO.com' => 'Website for music videos.',
          'PNAS' => 'Offical journal from United States National Academy of Sciences.',
          'The Atlantic' => 'News portal.',
          'ibVPN Login' => 'Logins to the ibVPN personal VPN service.',
          'Powermarks' => 'Bookmark extension for browsers like Netscape, IE, Mozilla, Opera and NetCaptor.',
          'JSTOR' => 'Digital library for academic journals and books.',
          'Resilio Sync' => 'Syncs files and folders across devices. Formerly BitTorrent Sync.',
          'Akamai NetSession Interface' => 'Interface for faster download.',
          'Firefox' => 'A mozilla web browser.',
          'Pocket' => 'App to save web pages.',
          'Lijit' => 'Advertising and analystics company.',
          'Coc Coc bot' => 'Web crawler for coccoc.com.',
          'Ovi Browser' => 'Mobile phone browser.',
          'New Relic' => 'Web metrics site.',
          'Apple App Store' => 'Apple iPhone app downloads. Different than Mac App Store.',
          'LOCKSS' => 'Lots of Copies Keep Stuff Safe, an open source digital preservation system.',
          'Yahoo! Messenger' => 'Yahoo!\'s instant messenger.',
          'WorldCat' => 'Library catalogue aggregator.',
          'NetNewsWire' => 'News feed and aggregator for iOS.',
          'Dragon Dictate' => 'Speach recognition software for Mac.',
          'Dilbert.com' => 'Offcial website for Dilbert, American comic strips.',
          'XProtectUpdater' => 'Anti-malware for Mac OS also called File Quarantine.',
          'Hotels.com' => 'Webportal for finding hotel deals and booking it online.',
          'Python urllib' => 'Python library for opening URLs.',
          'Buffer' => 'App to share web pages with social media.',
          'Infinity Blade' => 'Mobile game.',
          'Apple Music' => 'Internet radio by Apple.',
          'ibVPN' => 'Traffic generated by ibVPN.',
          'URLAppendBot' => 'Prodcut of Profound Network, Web crawler to retreive correct business domain based on the input.',
          'Owlinbot' => 'Web crawler.',
          'Grantland' => 'Web portal for sports news by ESPN.',
          'Apache Nutch' => 'Open soruce web crawler.',
          'MapMyFitness' => 'App to track the workouts and calorie.',
          'HBO GO' => 'Mobile app for HBO subscribers to watch HBO programming.',
          'The Independent' => 'Online portal for UK based and world news.',
          'Hide My Ass!' => 'Web surfing anonymizer.',
          'Tinder' => 'Social Network for connecting people.',
          'Cisco' => 'Official website for Cisco.',
          'Yeti Bot' => 'Web crawler used for game purpose.',
          'Radian6 CommentReader' => 'Web crawler for Radian6.',
          'Google PageSpeed' => 'Website analyze and optimizer by Google.',
          'Mathworks' => 'Producers of MATLAB and other tools for science and engineering.',
          'Dots' => 'Mobile game for connecting dots.',
          'urlgrabber' => 'Python package for fetching files.',
          'OSSProxy' => 'OSS Proxy daemon for open source software for sound devices.',
          'Svpply' => 'Online shopping portal.',
          'HBO' => 'Offical website for HBO shows.',
          'MobileAsset' => 'Track organizational assets.',
          'uTorrent' => 'BitTorrent client known for its lightweight and efficient design.',
          'MCStats' => 'Free plugin metrics.',
          'Mediabot' => 'Web crawler used by Google AdSense.',
          'Sage' => 'RSS and News Aggregator.',
          'Panoramio' => 'Social network for sharing interesting places through photo.',
          'StreetFire' => 'Video portal for Automotive enthusiasts.',
          'Xenu Link Sleuth' => 'App to check for broken link in the website.',
          'UpToDate' => 'Online clinical database for medical professionals.',
          'Google URL Shortener' => 'Shortens URL for website.',
          'Coupa' => 'Procurement software.'
        };

--]]

require "DetectorCommon"


local DC = DetectorCommon

DetectorPackageInfo = {
    name =  "payload_group_tmbg",
    proto =  DC.ipproto.tcp,
    client = {
        init =  'DetectorInit',
        clean =  'DetectorClean',
        minimum_matches =  1
    }
}

--serviceId, clientId, ClientType, PayloadId, PayloadType, hostPattern, pathPattern, schemePattern, queryPattern
gUrlPatternList = {

    -- Boxoh
    { 0, 0, 0, 1149, 16, "boxoh.com", "/", "http:", "", 2322},
 -- Tinder
    { 0, 0, 0, 1150, 5, "gotinder.com", "/", "http:", "", 2302},
 -- MyNutchSpider
    { 0, 0, 0, 1151, 22, "gotinder.com", "/", "http:", "", 2330},
    { 0, 0, 0, 1151, 22, "nutch.apache.org", "/", "http:", "", 2330},
 -- InfinityBlade
    { 0, 0, 0, 1152, 22, "infinitybladegame.com", "/", "http:", "", 2335},
 --  The Atlantic
    { 0, 0, 0, 1153, 22, "theatlantic.com", "/", "http:", "", 2424},
    { 0, 0, 0, 1153, 22, "theatlantic.disqus.com", "/", "http:", "", 2424},
    { 0, 0, 0, 1153, 22, "atlanticmedia.122.2o7.net", "/", "http:", "", 2424},
 --  Svpply
    { 0, 0, 0, 1154, 22, "svpply.com", "/", "http:", "", 2425},
 --  StreetFire
    { 0, 0, 0, 1155, 22, "streetfire.net", "/", "http:", "", 2426},
    { 0, 0, 0, 1155, 22, "streetfire.com", "/", "http:", "", 2426},
    { 0, 0, 0, 1155, 22, "streetfire.disqus.com", "/", "http:", "", 2426},
 --  Southern Living
    { 0, 0, 0, 1156, 33, "southernliving.com", "/", "http:", "", 2427},
    { 0, 0, 0, 1156, 33, "southernliving.timeinc.net", "/", "http:", "", 2427},
-- cnet download
    { 0, 0, 0, 1157, 22, "download.cnet.com", "/", "http:", "", 1171},
 --  Coupa
    { 0, 0, 0, 1158, 24, "coupa.com", "/", "http:", "", 2429},
 --  The Escapist Magazine
    { 0, 0, 0, 1159, 33, "escapistmagazine.com", "/", "http:", "", 2430},
 --  Pocket
    { 0, 0, 0, 1160, 22, "getpocket.com", "/", "http:", "", 2431},
 --  Grantland
    { 0, 0, 0, 1161, 33, "grantland.com", "/", "http:", "", 2432},
 --  The Independent
    { 0, 0, 0, 1162, 33, "independent.co.uk", "/", "http:", "", 2433},
    { 0, 0, 0, 1162, 33, "independentnews.disqus.com", "/", "http:", "", 2433},
 --  Instapaper
    { 0, 0, 0, 1163, 22, "instapaper.com", "/", "http:", "", 2434},
 --  KBS
    { 0, 0, 0, 1164, 22, "kbs.co.kr", "/", "http:", "", 2435},
 --  Moped
 -- { 0, 0, 0, 1165, 22, "moped.com", "/", "http:", "", 2436},
 --  Pinboard
    { 0, 0, 0, 1166, 22, "pinboard.in", "/", "http:", "", 2437},
 --  Pushover
    { 0, 0, 0, 1167, 22, "pushover.net", "/", "http:", "", 2438},
 --  Realview TV
    { 0, 0, 0, 1168, 22, "realviewtv.com", "/", "http:", "", 2439},
 --  Dots
    { 0, 0, 0, 1169, 22, "weplaydots.com", "/", "http:", "", 2440},
 --  Buffer
    { 0, 0, 0, 1170, 22, "bufferapp.com", "/", "http:", "", 2428},
    { 0, 0, 0, 1170, 22, "buffer.com", "/", "http:", "", 2428},
    -- JonDo
    { 0, 402, 23, 0, 0, "72.55.137.241", "/mixcascadestatus", "http:", "", 2947},
    { 0, 402, 23, 0, 0, "is1.anonmix.eu/", "/mixcascadestatus", "http:", "", 2947},
    { 0, 402, 23, 0, 0, "is2.anonmix.eu/", "/mixcascadestatus", "http:", "", 2947},
    { 0, 402, 23, 0, 0, "infoservice.inf.tu-dresden.de/", "/mixcascadestatus", "http:", "", 2947},
    { 0, 402, 23, 0, 0, "is.beneficium.de/", "/mixcascadestatus", "http:", "", 2947},
    -- Hide My Ass!
    { 0, 0, 0, 1208, 46, "hidemyass.com", "/", "http:", "", 2648},
    -- ibVPN Login
    { 0, 0, 0, 1205, 46, "ibvpn.com", "/billing/clientarea", "http:", "", 2680},
    -- ibVPN
    { 0, 0, 0, 1864, 46, "ibvpn.com", "/", "http:", "", 3996},
    -- Hideman
    { 0, 0, 0, 1206, 46, "hideman.com", "/", "http:", "", 2681},
    { 0, 0, 0, 1206, 46, "hideman.net", "/", "http:", "", 2681},
    { 0, 0, 0, 1206, 46, "mc.yandex.ru", "/", "http:", "", 2681},
 --  Samsung Wallet
 ---{ 0, 0, 0, 1171, 22, "wallet.samsung.com", "/", "http:", "", 2649},
 --  VEVO
    { 0, 0, 0, 1172, 22, "vevo.com", "/", "http:", "", 2650},
 --  PNAS
    { 0, 0, 0, 1173, 22, "pnas.org", "/", "http:", "", 2651},
    { 0, 0, 0, 1173, 22, "pnascentral.org", "/", "http:", "", 2651},
 --  HBO
    { 0, 0, 0, 1174, 22, "hbo.com", "/", "http:", "", 2652},
    -- HBO Go
    { 0, 0, 0, 1231, 22, "hbogo.com", "/", "http:", "", 2711},
 --  Stitcher
    { 0, 0, 0, 1175, 22, "stitcher.com", "/", "http:", "", 2653},
    { 0, 0, 0, 1175, 22, "stitcher.assets.s3.amazonaws.com", "/", "http:", "", 2653},
 --  Panoramio
    { 0, 0, 0, 1176, 22, "panoramio.com", "/", "http:", "", 2654},
 --  Cisco
    { 0, 0, 0, 1177, 22, "cisco.com", "/", "http:", "", 2655},
 --  The Baltimore Sun
    { 0, 0, 0, 1178, 22, "baltimoresun.com", "/", "http:", "", 2656},
 --  Dilbert.com
    { 0, 0, 0, 1179, 22, "dilbert.com", "/", "http:", "", 2657},
    { 0, 0, 0, 1179, 22, "thedilbertstore.com", "/", "http:", "", 2657},
 --  Google URL Shortener
    { 0, 0, 0, 1180, 22, "goo.gl", "/", "http:", "", 2658},
 --  Hotels.com
    { 0, 0, 0, 1181, 22, "hotels.com", "/", "http:", "", 2659},
    { 0, 0, 0, 1181, 22, "cdn-hotels.com", "/", "http:", "", 2659},
 --  JSTOR
    { 0, 0, 0, 1182, 22, "jstor.org", "/", "http:", "", 2660},
 --  Xiami.com
    { 0, 0, 0, 1184, 22, "xiami.com", "/", "http:", "", 2661},
 --  INRIX
    { 0, 0, 0, 1185, 22, "inrix.com", "/", "http:", "", 2662},
    -- Genieo
    { 0, 0, 0, 1209, 22, "genieo.com", "/", "http:", "", 2686},
    -- Mathworks
    { 0, 0, 0, 1210, 12, "mathworks.com", "/", "http:", "", 2687},
    -- GoodSync
    { 0, 0, 0, 1211, 9, "goodsync.com", "/", "http:", "", 2688},
    -- UpToDate
    { 0, 0, 0, 1212, 12, "uptodate.com", "/", "http:", "", 2689},
    -- New Relic
    { 0, 0, 0, 1213, 16, "newrelic.com", "/", "http:", "", 2690},
    -- WorldCat
    { 0, 0, 0, 1214, 12, "worldcat.org", "/", "http:", "", 2691},
 --  Lijit
    { 0, 0, 0, 1186, 22, "lijit.com", "/", "http:", "", 2663},
 --  Moat
    { 0, 0, 0, 1187, 22, "moat.com", "/", "http:", "", 2664},
    { 0, 0, 0, 1187, 22, "moatads.com", "/", "http:", "", 2664},
    { 0, 0, 0, 1187, 22, "moatsearch-data.s3.amazonaws.com", "/", "http:", "", 2664},
 --  Ando Media
    { 0, 0, 0, 1188, 22, "andomedia.com", "/", "http:", "", 2665},
 --  Break.com
    { 0, 0, 0, 1189, 22, "break.com", "/", "http:", "", 2666},
    { 0, 0, 0, 1189, 22, "breakmedia.com", "/", "http:", "", 2666},
 --  Apple Music
    { 0, 0, 0, 1190, 22, "streamingaudio.itunes.apple.com", "/", "http:", "", 2669},
    { 0, 0, 0, 1190, 22, "ns-streamingaudio.itunes.apple.com", "/", "http:", "", 2669},
    { 0, 0, 0, 1190, 22, "gs.apple.com", "/", "http:", "", 2669},
    { 0, 0, 0, 1190, 22, "albert.apple.com", "/", "http:", "", 2669},
}


function DetectorInit(detectorInstance)

-- ClientType, DHPSequence,  serviceId, clientId, PayloadId,  hostPattern, pathPattern, schemePattern, queryPattern
    gDetector = detectorInstance;

    -- Yeti Bot
    gDetector:addHttpPattern(2, 5, 0, 373, 19, 0, 0, 'Yeti/', 2310);
    -- XProtectUpdater
    gDetector:addHttpPattern(2, 5, 0, 360, 19, 0, 0, 'XProtectUpdater', 2297);
    -- Xenu Link Sleuth
    gDetector:addHttpPattern(2, 5, 0, 361, 19, 0, 0, 'Xenu Link Sleuth', 2298);
    -- uTorrent
    gDetector:addHttpPattern(2, 5, 0, 362, 19, 0, 0, 'uTorrent', 2299);
    -- URLAppendBot
    gDetector:addHttpPattern(2, 5, 0, 363, 1, 0, 0, 'URLAppendBot', 2300);
    -- Tiny Tiny RSS
    gDetector:addHttpPattern(2, 5, 0, 364, 1, 0, 0, 'Tiny Tiny RSS/', 2301);
    -- Tinder
    gDetector:addHttpPattern(2, 5, 0, 365, 1, 0, 0, 'Tinder/', 2302);
    -- Sage
    gDetector:addHttpPattern(2, 5, 0, 366, 1, 0, 0, 'Sage', 2303);
    -- Radian6 CommentReader
    gDetector:addHttpPattern(2, 5, 0, 368, 1, 0, 0, 'R6_CommentReader', 2305);
    -- Powermarks
    gDetector:addHttpPattern(2, 5, 0, 369, 1, 0, 0, 'Powermarks/', 2306);
    -- PDFExpert
    gDetector:addHttpPattern(2, 5, 0, 370, 1, 0, 0, 'PDFExpert/', 2307);
    -- Google PageSpeed
    gDetector:addHttpPattern(2, 5, 0, 371, 1, 0, 0, 'pagespeed', 2308);
    -- Owlinbot
    gDetector:addHttpPattern(2, 5, 0, 372, 1, 0, 0, 'Owlinbot', 2309);
    -- Dr. Watson
    gDetector:addHttpPattern(2, 5, 0, 378, 24, 0, 0, 'MSDW', 2318);
    -- NetSight
    gDetector:addHttpPattern(2, 5, 0, 379, 20, 0, 0, 'NetSight/', 2319);
    -- Ovi Browser
    gDetector:addHttpPattern(2, 5, 0, 380, 1, 0, 0, 'OviBrowser/', 2320);
    gDetector:addHttpPattern(2, 5, 0, 380, 1, 0, 0, 'S40OviBrowser/', 2320);
    -- Penultimate
    gDetector:addHttpPattern(2, 5, 0, 381, 24, 0, 0, 'Penultimate/', 2321);
    -- OSSProxy
    gDetector:addHttpPattern(2, 5, 0, 382, 19, 0, 0, 'OSSProxy', 2323);
    -- NetNewsWire
    gDetector:addHttpPattern(2, 5, 0, 383, 19, 0, 0, 'NetNewsWire', 2324);
    -- urlgrabber
    gDetector:addHttpPattern(2, 5, 0, 385, 19, 0, 0, 'urlgrabber', 2329);
    -- Yahoo! Messenger
    gDetector:addHttpPattern(2, 5, 0, 22, 6, 0, 0, 'net_http_transaction_impl_manager', 936);
    -- Apache Nutch
    gDetector:addHttpPattern(2, 5, 0, 386, 1, 0, 0, 'MyNutchSpider', 2330);
    -- MobileAsset
    gDetector:addHttpPattern(2, 5, 0, 387, 24, 0, 0, 'MobileAsset', 2331);
    -- MCStats
    gDetector:addHttpPattern(2, 5, 0, 388, 24, 0, 0, 'MCStats', 2332);
    -- MapMyFitness
    gDetector:addHttpPattern(2, 5, 0, 389, 19, 0, 0, 'MapMyFitness', 2333);
    gDetector:addHttpPattern(2, 5, 0, 389, 19, 0, 0, 'iMapMyFitness', 2333);
    -- JikeSpider
    gDetector:addHttpPattern(2, 5, 0, 390, 1, 0, 0, 'JikeSpider', 2334);
    -- Infinity Blade
    gDetector:addHttpPattern(2, 5, 0, 391, 19, 0, 0, 'InfinityBlade2', 2335);
    -- Mediabot
    gDetector:addHttpPattern(2, 5, 0, 392, 1, 0, 0, 'Mediapartners-Google', 2336);
    -- Feed43
    gDetector:addHttpPattern(2, 5, 0, 393, 1, 0, 0, 'Feed43 Proxy', 2337);
    -- Dragon Dictate
    gDetector:addHttpPattern(2, 5, 0, 394, 24, 0, 0, 'Dictate', 2338);
    -- Coc Coc bot
    gDetector:addHttpPattern(2, 5, 0, 395, 24, 0, 0, 'coccoc', 2339);
    -- Firefox
    gDetector:addHttpPattern(2, 5, 0, 32, 1, 0, 0, 'Minefield', 638);
    -- Akamai NetSession Interface
    gDetector:addHttpPattern(2, 5, 0, 396, 1, 0, 0, 'Akamai NetSession Interface', 2420);
    -- AhrefsBot
    gDetector:addHttpPattern(2, 5, 0, 397, 1, 0, 0, 'AhrefsBot', 2421);
    -- AddThis Bot
    gDetector:addHttpPattern(2, 5, 0, 398, 1, 0, 0, 'AddThis.com robot', 2422);
    -- IMTransferAgent
    gDetector:addHttpPattern(2, 5, 0, 399, 1, 0, 0, 'IMTransferAgent', 2423);
    -- LOCKSS
    gDetector:addHttpPattern(2, 5, 0, 400, 10, 0, 0, 'LOCKSS', 2636);
    gDetector:addHttpPattern(2, 5, 0, 400, 10, 0, 0, 'LOCKSS cache', 2636);
    -- Dots
    gDetector:addHttpPattern(2, 5, 0, 401, 1, 0, 0, 'dots/', 2440);
    -- JonDo
    gDetector:addHttpPattern(2, 5, 0, 402, 23, 0, 0, 'RTP-HTTPClient/', 2947);
    -- Samsung Wallet
    --gDetector:addHttpPattern(1, 0, 0, 404, 1, 0, 0, 'wallet.samsung.com', 2649, 1);
    -- INRIX
    gDetector:addHttpPattern(2, 5, 0, 405, 1, 0, 0, 'android-inrix-mobile-app', 2662);
    -- Python urllib2
    gDetector:addHttpPattern(2, 5, 0, 406, 1, 0, 0, 'Python-urllib/', 2685);
   -- Resilio Sync Client tcppattern
    gDetector:addHttpPattern(2, 5, 0, 407, 1, 0, 0, 'BitTorrent%20Sync/', 2667);
   -- Printer Pro
    gDetector:addHttpPattern(2, 5, 0, 408, 1, 0, 0, 'Printer%20Pro%20Desktop/', 2668);
    -- Apple App Store
    gDetector:addHttpPattern(2, 5, 0, 409, 19, 0, 0, 'AppStore/', 2694);
    gDetector:addHttpPattern(2, 5, 0, 409, 19, 0, 0, 'Apple%20Store/', 2694);
    -- HBO GO
    gDetector:addHttpPattern(2, 5, 0, 413, 19, 0, 0, 'HBO GO ',  2711);

    if gDetector.addAppUrl then
        for i,v in ipairs(gUrlPatternList) do
            gDetector:addAppUrl(v[1],v[2],v[3],v[4],v[5],v[6],v[7],v[8],v[9],v[10]);
        end
    end

    return gDetector;
end

function DetectorClean()
end
