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
detection_name: SSL Group "Belvedere"
version: 53
description: Group of SSL Host detectors.
bundle_description: $VAR1 = {
          'Geewa' => 'Browser and Facebook-based gaming.',
          'Urban Airship' => 'Mobile app developer.',
          'Adcash' => 'Advertising network.',
          'Jingdong (360buy.com)' => 'Chinese e-commerce site.',
          'Facebook' => 'Facebook is a social networking service.',
          'Avaya Live' => 'Cloud based VoIP service.',
          'The Guardian' => 'Online news portal.',
          'Google' => 'Traffic generated by the Google search engine or one of the other many Internet services provided by Google Inc.',
          'Apple Developer' => 'Web portal for Apple Developer.',
          'Livedoor' => 'Japanese Internet service provider.',
          'BioDigital Human' => 'A web-based medical imaging app.',
          'Loyalty Innovations' => 'Reward programs and solutions for both online and offline.',
          'AOL' => 'American company develops, grows and invests in brands and web sites.',
          'CSDN' => 'Chinese IT community/forum for Software related issues.',
          'Dailymotion' => 'A video sharing service website.',
          'Yandex' => 'Russian search engine.',
          'Discover' => 'Financial services company.',
          'Naver' => 'Web portal.',
          'Amazon Web Services' => 'Online cloud computing service.',
          'Aliexpress' => 'Online shopping portal.',
          'GoToMyPC' => 'PC remote control software.',
          'Rakuten' => 'Japanese e-commerce site.',
          'American Express' => 'Financial services company.',
          'Snapchat' => 'Online photo sharing.',
          'The Telegraph' => 'Online news portal.',
          'The New York Times' => 'Newspaper website.',
          'Shutterstock' => 'Online collection of Stock photographs and illustrations.',
          'Instagram' => 'Mobile phone photo sharing.',
          '58 City' => 'Classified information about 58 cities in China.',
          'Official Major League Baseball' => 'Web Portal for Sports news update.',
          'CloudFront' => 'Content Delivery for AWS.',
          'Flurry Analytics' => 'Mobile application analytics.',
          'Bank of America' => 'Global financial services company.',
          'Spotify' => 'Social Music Player.',
          'Pinterest' => 'Social photo sharing website.',
          'E*TRADE' => 'Financial services company with a focus on online stock brokerage.',
          'Dwolla' => 'Online Payment service.',
          'Shutterfly' => 'Share, prints and personalize the cards, album, mugs and other Home decor items with your photos.',
          'Airbnb' => 'Online accommodation rental service.',
          'KakaoTalk' => 'Mobile messaging for smartphones.',
          'Pubmatic' => 'Web advertisement services.',
          'ZEDO' => 'Web advertisement services.',
          'Yieldmanager' => 'Online advertising delivery portal.',
          'King.com' => 'Web-based gaming.',
          'Invitemedia' => 'Advertising portal.',
          'Wells Fargo' => 'Global financial services company.',
          'Square Inc.' => 'Electronic payment service through mobile phones.',
          'Wooga' => 'Browser and social network based games company.',
          'IMRWorldWide' => 'Market research and Network analytics to display advertisement.',
          'Etsy' => 'E-commerce website for homemade or vintage items.',
          'UOL' => 'Brazilian web portal for news and entertainment.',
          'Citi' => 'Financial services company.',
          'Odnoklassniki' => 'Russian social networking service.',
          'FireAMP' => 'Cloud-based real time antivirus protection.',
          'Siri' => 'Voice interactive agent for Apple\'s iOS.',
          'Mint.com' => 'Web-based personal finance tool.',
          'Craigslist' => 'Popular online classifieds.',
          'HSBC' => 'Global banking and financial services company.',
          'Airtime' => 'Video chat.',
          'Scottrade' => 'Discount brokerage service.',
          'Exchange Online' => 'Traffic associated with Exchange Online, such as visiting outlook.com.',
          'Akamai' => 'Internet content delivery network and SSL certificate provider.',
          '500px' => 'Online photo sharing.',
          'U.S.Bank' => 'Online banking web portal for U.S Bank.',
          'Rediff.com' => 'Online news, information and web portal.',
          'iTunes' => 'Apple\'s media player and online store.',
          'Taringa' => 'Argentinian Social network.',
          'PayPal' => 'E-commerce website for handling online transactions.',
          'Spiegel Online' => 'Web portal for the Germans magazine Der Speigel.',
          'Google Remote Desktop' => 'Online desktop sharing service.',
          'Symantec System Center' => 'Anti-virus software management.',
          'Gmail' => 'Google online email.',
          'USPS' => 'US Postal Service website.',
          'LivingSocial' => 'Deals website.',
          'T Mobile' => 'Telecommunication and phone service provider.',
          'Capital One' => 'U.S. based bank holding company.',
          'Chase' => 'Consumer and commercial banking company.',
          'Doubleclick' => 'Web advertisement services.',
          'Comcast' => 'Web Portal.'
        };

--]]

require "DetectorCommon"


local DC = DetectorCommon

DetectorPackageInfo = {
    name =  "ssl_hosy_group_balvenie",
    proto =  DC.ipproto.tcp,
    client = {
        init =  'DetectorInit',
        clean =  'DetectorClean',
        minimum_matches =  1
    }
}

--serviceId, clientId, ClientType, PayloadId, PayloadType, hostPattern, pathPattern, schemePattern, queryPattern
gSSLHostPatternList = {

    -- FireAMP
    { 1, 934, 'amp.cisco.com' },
    { 1, 934, 'amp.sourcefire.com' },
    -- Immunet client
    -- { 0, 934, 'immunet.com' },
    -- Zynga
    { 0, 533, 'zgncdn.com' },
    { 0, 533, 'zyngawithfriends.com' },
    { 0, 533, 'zc-prod.treasure.zynga.com' },
    { 0, 533, 'wwf-fb.zyngawithfriends.com' },
    { 0, 533, 'api.zynga.com' },
    { 0, 533, 'cafe.zynga.com' },
    { 0, 533, 'wordswithfriends.zyngawithfriends.com' },
    { 0, 533, 'hangingwithfriends.zyngawithfriends.com' },
    { 0, 533, 'treasure.zynga.com' },
    { 0, 533, 'static.zynga.com' },
    { 0, 533, 'zynga.com' },
    { 0, 533, 'zynga1-a.akamaihd.net' },
    { 0, 533, 'zynga2-a.akamaihd.net' },
    -- Wooga
    { 0, 1298, 'cdn-mkt.wooga.com' },
    { 0, 1298, 'wooga.com' },
    ---- SchoolFeed
    --{ 0, 1249, 'your.schoolfeed.com' },
    --{ 0, 1249, 'schoolfeed.com' },
    -- Bubble Saga
    { 0, 1244, 'bubblesaga.king.com' },
    -- Mesmo Games
    { 0, 1240, 'secure.mesmo.tv' },
    -- Avast AV
    { 0, 1264, 'static2.avast.com' },
    { 0, 1264, 'avast.com' },
    -- BranchOut
    { 0, 1250, 'branchout.com' },
    -- AllMyApps
    { 0, 1265, 'buildyourapps.info' },
    -- cartown
    --{ 0, 1242, 'secure.cartown.com' },
    --{ 0, 1242, 'cartown.com' },
    -- DoubleDownCasino
    { 0, 1234, 'facebook.doubledowncasino.com' },
    { 0, 1234, 'doubledowncasino.com' },
    -- Empires and Allies
    --{ 0, 1255, 'fb-zc.empire.zynga.com' },
    --{ 0, 1255, 'empire.zynga.com' },
    -- Evernote
    { 0, 1267, 'www.evernote.com' },
    -- Family Tree
    { 0, 1236, 'fbshard.apps.familybuilder.com' },
    { 0, 1236, 'apps.familybuilder.com' },
    -- Fruit Ninja Fantasy
    -- { 0, 1246, 'www.fruitninjafrenzygame.info' },
    -- biodigitalhuman
    { 0, 1595, 'www.biodigitalhuman.com' },
    { 0, 1595, 'biodigitalhuman.com' },
    { 0, 1595, 'biodigital.com' },
    { 0, 1595, 'www.biodigital.com' },
    -- Geewa
    { 0, 1597, 'geewa-cdn.com' },
    { 0, 1597, 'geewa-apps.com' },
    { 0, 1597, 'geewa.com' },
    -- GoToMyPC
    { 0, 1598, 'www.gotomypc.com' },
    -- Midasplayer
    { 0, 1599, 'Midasplayer.com' },
    { 0, 1599, 'midasplayer.com' },
    { 0, 1599, 'king.com' },
    -- Ubuntu One
    --{ 0, 1600, 'fs-1.one.ubuntu.com' },
    --{ 0, 1600, 'one.ubuntu.com' },
    -- USPS
    { 0, 1601, 'sdc.usps.com' },
    { 0, 1601, 'usps.com' },
    { 0, 1601, 'www.uspspostalone.com' },
    -- Outbrain
    { 0, 1369, 'www.outbrain.com' },
    -- Foursquare
    --{ 0, 1350, 'foursquare.com' },
    --{ 0, 1350, '4sqi.net' },
    -- Airtime
    { 0, 1645, 'www.airtime.com' },
    { 0, 1645, 'airtime.com' },
    -- Xcode
    { 0, 1596, 'developer.apple.com' },
    { 0, 1596, 'devimages.apple.com' },
    { 0, 1596, 'devimages.apple.com.edgekey.net' },
    -- Siri
    { 0, 1603, 'guzzoni.apple.com' },
    { 0, 1603, 'daryl.apple.com' },
    { 0, 1603, 'smoot.apple.com' },
    -- AWS
    { 0, 1392, 's3-external-1.amazonaws.com' },
    { 0, 1392, 's3.amazonaws.com' },
    { 0, 1392, 'mfcdn.s3.amazonaws.com' },
    { 0, 1392, 'portal.aws.amazon.com' },
    { 0, 1392, 'signin.aws.amazon.com' },
    { 0, 1392, 'aws.amazon.com' },
    { 0, 1392, 'images-na.ssl-images-amazon.com' },
    { 0, 1392, 'awsstatic.com' },
    { 0, 1392, 'amazonwebservicesinc.tt.omtrdc.net' },
    -- Dailymotion
    { 0, 600, 'dailymotion.com' },
    { 0, 600, 'www.dailymotion.com' },
    { 0, 600, 'dailymotion.com' },
    -- CloudFront
    { 0, 1393, 'cloudfront.net' },
    { 0, 1393, 'cloudfront.net' },
    -- Paypal
    { 0, 1134, 'www.paypal.com' },
    { 0, 1134, 't.paypal.com' },
    { 0, 1134, 'www.paypalobjects.com' },
    { 0, 1134, 'paypal-search.com' },
    { 0, 1134, 'personal.paypal.com' },
    { 0, 1134, 'paypal.dl.sc.omtrdc.net' },
    -- Etsy
    { 0, 1374, 'etsy.com' },
    { 0, 1374, 'www.etsy.com' },
    { 0, 1374, 'bcn.etsy.com' },
    -- Craigslist
    { 0, 594, 'craigslist.org' },
    { 0, 594, 'post.craigslist.org' },
    { 0, 594, 'accounts.craigslist.org' },
    -- Kakao
    { 1, 1405, 'kakao.com' },
    { 1, 1405, 'item.kakao.com' },
    -- DoubleClick
    { 0, 1313, 'g.doubleclick.net' },
    { 0, 1313, 'doubleclick.net' },
    { 0, 1313, 'ad.doubleclick.net' },
    { 0, 1313, 'googleads.g.doubleclick.net' },
    { 0, 1313, 'fls.doubleclick.net' },
    -- Flurry
    { 0, 1406, 'flurry.com' },
    -- iTunes
    { 0, 689, 'metrics.mzstatic.com' },
    { 0, 689, 'mzstatic.com' },
    { 0, 689, 's.mzstatic.com' },
    { 0, 689, 'itunes.apple.com' },
    -- Symantec
    { 0, 459, 'shasta-rrs.symantec.com' },
    { 0, 459, 'symantec.com' },
    { 0, 459, 'symanteccloud.com' },
    { 0, 459, 'symantec.tt.omtrdc.net' },
    -- Comcast
    { 0, 1365, 'comcast.com' },
    { 0, 1365, 'comcast.net' },
    -- Exchange Online
    { 0, 2810, 'r3.res.outlook.com' },
    { 0, 2810, 'res.outlook.com' },
    { 0, 2810, 'outlook.com' },
    { 0, 2810, 'Outlook.com' },
    { 0, 2810, 'pop3.live.com' },
    { 0, 2810, 'outlook.office.com' },
    { 0, 2810, 'r1.res.office365.com' },
    { 0, 2810, 'r3.res.office365.com' },
    { 0, 2810, 'r4.res.office365.com' },
    { 0, 2810, 'hybridconfiguration.azurewebsites.net' },
    { 0, 2810, 'outlook.office365.com' },
    { 0, 2810, 'smtp.office365.com' },
    { 0, 2810, 'domains.live.com' },
    { 0, 2810, 'protection.outlook.com' },
    { 0, 2810, 'outlook.com' },
    -- Pinterest
    { 1, 1135, 'pinterest.com' },
    -- Instagram
    { 1, 1233, 'instagram.com' },
    -- Bank of America
    { 0, 560, 'www.bankofamerica.com' },
    { 0, 560, 'bankofamerica.com' },
    { 0, 560, 'bankofamerica.tt.omtrdc.net' },
    { 0, 560, 'bac-assets.com' },
    -- Capital One
    { 0, 582, 'www.capitalone.com' },
    { 0, 582, 'capitalone.com' },
    -- Chase
    { 0, 587, 'www.chase.com' },
    { 0, 587, 'chase.com' },
    -- Citi
    { 0, 590, 'citibank.com' },
    { 0, 590, 'citi.bridgetrack.com' },
    { 0, 590, 'citi.com' },
    { 0, 590, 'citicorpcreditservic.tt.omtrdc.net' },
    -- HSBC
    { 0, 675, 'hsbc.com' },
    { 0, 675, 'member-hsbc-group.com' },
    -- American Express
    { 0, 544, 'www.americanexpress.com' },
    { 0, 544, 'www.aexp-static.com' },
    { 0, 544, 'americanexpress.com' },
    -- Wells Fargo
    { 0, 907, 'www.wellsfargo.com' },
    { 0, 907, 'wellsfargo.com' },
    -- US Bank
    { 0, 1500, 'usbank.tt.omtrdc.net' },
    { 0, 1500, 'usbank.com' },
    { 0, 1500, 'usbank.com' },
    -- Mint.com
    { 0, 1193, 'www.mint.com' },
    { 0, 1193, 'mint.com' },
    -- Discover
    { 0, 615, 'www.discover.com' },
    { 0, 615, 'discover.com' },
    { 0, 615, 'discovercard.com' },
    { 0, 615, 'discover.tt.omtrdc.net' },
    -- E*Trade
    { 0, 621, 'etrade.com' },
    { 0, 621, 'etrade.net' },
    { 0, 621, 'etradefinancial.tt.omtrdc.net' },
    { 0, 621, 'etrade.wsod.com' },
    { 0, 621, 'etrade.122.2o7.net' },
    -- Scottrade
    { 0, 820, 'scottrade.com' },
    -- Shutterfly
    { 0, 1543, 'shutterfly.com' },
    { 0, 1543, 'staticsfly.com' },
      -- The New York Times
    { 0, 1299, 'nytimes.com' },
      -- ZEDO
    { 0, 1362, 'zedo.com' },
      -- Pubmatic
    { 0, 1315, 'pubmatic.com' },
      -- LivingSocial
    { 0, 1495, 'livingsocial.com' },
    { 0, 1495, 'lscdn.net' },
      -- AOL
    { 0, 1419, 'aol.com' },
    { 0, 1419, 'aolcdn.com' },
    { 0, 1419, 'aol.de' },
    { 0, 1419, 'aol.fr' },
    { 0, 1419, 'aol.ca' },
    { 0, 1419, 'aol.it' },
    { 0, 1419, 'aol.jp' },
      -- Naver
    { 0, 1309, 'naver.com' },
      -- Spotify
    { 0, 1158, 'spotify.com' },
    { 0, 1158, 'spotify.edgekey.net' },
    { 0, 1158, 'scdn.co'},
      -- T Mobile
    { 0, 1545, 't-mobile.com' },
      -- Advertising.com
    { 0, 1545, 'advertising.com' },
      -- Square Inc
    { 0, 1568, 'squareup.com' },
    { 0, 1568, 'square.com' },
      -- IMRWorldWide
    { 0, 1560, 'imrworldwide.com' },
      -- Shutterstock
    { 0, 1614, 'secure.shutterstock.com' },
    { 0, 1614, 'shutterstock.com' },
      -- Yandex
    { 0, 1616, 'yandex.by' },
    { 0, 1616, 'yandex.kz' },
    { 0, 1616, 'yandex.ru' },
    { 0, 1616, 'yandex.st' },
    { 0, 1616, 'yandex.com' },
    { 0, 1616, 'yandex.ua' },
    { 0, 1616, 'yandex.com.tr' },
      -- Adcash
    { 0, 1617, 'adcash.com' },
      -- The Guardian
    { 0, 1618, 'guardian.co.uk' },
    { 0, 1618, 'guim.co.uk' },
      -- Yieldmanager
    { 0, 1619, 'yieldmanager.com' },
      -- The Telegraph
    { 0, 1620, 'telegraph.co.uk' },
      -- Livedoor
    { 0, 1621, 'livedoor.com' },
      -- Rediff.com
    { 0, 1624, 'rediff.com' },
      -- Spiegel Online
    { 0, 1625, 'spiegel.de' },
      -- UOL
    { 0, 1626, 'uol.com.br' },
      -- Jingdong (360buy.com)
    { 0, 1627, '360buy.com' },
    { 0, 1627, 'jd.com' },
    -- Google
    { 0, 184, 'google.com' },
    { 0, 184, 'gstatic.com' },
    { 0, 184, 'google.ac' },
    { 0, 184, 'google.ad' },
    { 0, 184, 'google.ae' },
    { 0, 184, 'google.com.af' },
    { 0, 184, 'google.com.ag' },
    { 0, 184, 'google.com.ai' },
    { 0, 184, 'google.al' },
    { 0, 184, 'google.am' },
    { 0, 184, 'google.co.ao' },
    { 0, 184, 'google.com.ar' },
    { 0, 184, 'google.as' },
    { 0, 184, 'google.at' },
    { 0, 184, 'google.com.au' },
    { 0, 184, 'google.az' },
    { 0, 184, 'google.ba' },
    { 0, 184, 'google.com.bd' },
    { 0, 184, 'google.be' },
    { 0, 184, 'google.bf' },
    { 0, 184, 'google.bg' },
    { 0, 184, 'google.com.bh' },
    { 0, 184, 'google.bi' },
    { 0, 184, 'google.bj' },
    { 0, 184, 'google.com.bn' },
    { 0, 184, 'google.com.bo' },
    { 0, 184, 'google.com.br' },
    { 0, 184, 'google.bs' },
    { 0, 184, 'google.bt' },
    { 0, 184, 'google.co.bw' },
    { 0, 184, 'google.by' },
    { 0, 184, 'google.com.bz' },
    { 0, 184, 'google.ca' },
    { 0, 184, 'google.com.kh' },
    { 0, 184, 'google.cc' },
    { 0, 184, 'google.cd' },
    { 0, 184, 'google.cf' },
    { 0, 184, 'google.cat' },
    { 0, 184, 'google.cg' },
    { 0, 184, 'google.ch' },
    { 0, 184, 'google.ci' },
    { 0, 184, 'google.co.ck' },
    { 0, 184, 'google.cl' },
    { 0, 184, 'google.cm' },
    { 0, 184, 'google.com.co' },
    { 0, 184, 'google.co.cr' },
    { 0, 184, 'google.com.cu' },
    { 0, 184, 'google.cv' },
    { 0, 184, 'google.com.cy' },
    { 0, 184, 'google.cz' },
    { 0, 184, 'google.de' },
    { 0, 184, 'google.dj' },
    { 0, 184, 'google.dk' },
    { 0, 184, 'google.dm' },
    { 0, 184, 'google.com.do' },
    { 0, 184, 'google.dz' },
    { 0, 184, 'google.com.ec' },
    { 0, 184, 'google.ee' },
    { 0, 184, 'google.com.eg' },
    { 0, 184, 'google.es' },
    { 0, 184, 'google.com.et' },
    { 0, 184, 'google.fi' },
    { 0, 184, 'google.com.fj' },
    { 0, 184, 'google.fm' },
    { 0, 184, 'google.fr' },
    { 0, 184, 'google.ga' },
    { 0, 184, 'google.ge' },
    { 0, 184, 'google.gg' },
    { 0, 184, 'google.com.gh' },
    { 0, 184, 'google.com.gi' },
    { 0, 184, 'google.gl' },
    { 0, 184, 'google.gm' },
    { 0, 184, 'google.gp' },
    { 0, 184, 'google.gr' },
    { 0, 184, 'google.com.gt' },
    { 0, 184, 'google.gy' },
    { 0, 184, 'google.com.hk' },
    { 0, 184, 'google.hn' },
    { 0, 184, 'google.hr' },
    { 0, 184, 'google.ht' },
    { 0, 184, 'google.hu' },
    { 0, 184, 'google.co.id' },
    { 0, 184, 'google.iq' },
    { 0, 184, 'google.ie' },
    { 0, 184, 'google.co.il' },
    { 0, 184, 'google.im' },
    { 0, 184, 'google.co.in' },
    { 0, 184, 'google.is' },
    { 0, 184, 'google.it' },
    { 0, 184, 'google.je' },
    { 0, 184, 'google.com.jm' },
    { 0, 184, 'google.jo' },
    { 0, 184, 'google.co.jp' },
    { 0, 184, 'google.co.ke' },
    { 0, 184, 'google.ki' },
    { 0, 184, 'google.kg' },
    { 0, 184, 'google.co.kr' },
    { 0, 184, 'google.com.kw' },
    { 0, 184, 'google.kz' },
    { 0, 184, 'google.la' },
    { 0, 184, 'google.com.lb' },
    { 0, 184, 'google.li' },
    { 0, 184, 'google.lk' },
    { 0, 184, 'google.co.ls' },
    { 0, 184, 'google.lt' },
    { 0, 184, 'google.lu' },
    { 0, 184, 'google.lv' },
    { 0, 184, 'google.com.ly' },
    { 0, 184, 'google.co.ma' },
    { 0, 184, 'google.md' },
    { 0, 184, 'google.me' },
    { 0, 184, 'google.mg' },
    { 0, 184, 'google.mk' },
    { 0, 184, 'google.ml' },
    { 0, 184, 'google.com.mm' },
    { 0, 184, 'google.mn' },
    { 0, 184, 'google.ms' },
    { 0, 184, 'google.com.mt' },
    { 0, 184, 'google.mu' },
    { 0, 184, 'google.mv' },
    { 0, 184, 'google.mw' },
    { 0, 184, 'google.com.mx' },
    { 0, 184, 'google.com.my' },
    { 0, 184, 'google.co.mz' },
    { 0, 184, 'google.com.na' },
    { 0, 184, 'google.ne' },
    { 0, 184, 'google.com.nf' },
    { 0, 184, 'google.com.ng' },
    { 0, 184, 'google.com.ni' },
    { 0, 184, 'google.nl' },
    { 0, 184, 'google.no' },
    { 0, 184, 'google.com.np' },
    { 0, 184, 'google.nr' },
    { 0, 184, 'google.nu' },
    { 0, 184, 'google.co.nz' },
    { 0, 184, 'google.com.om' },
    { 0, 184, 'google.com.pk' },
    { 0, 184, 'google.com.pa' },
    { 0, 184, 'google.com.pe' },
    { 0, 184, 'google.com.ph' },
    { 0, 184, 'google.pl' },
    { 0, 184, 'google.com.pg' },
    { 0, 184, 'google.pn' },
    { 0, 184, 'google.com.pr' },
    { 0, 184, 'google.ps' },
    { 0, 184, 'google.pt' },
    { 0, 184, 'google.com.py' },
    { 0, 184, 'google.com.qa' },
    { 0, 184, 'google.ro' },
    { 0, 184, 'google.rs' },
    { 0, 184, 'google.ru' },
    { 0, 184, 'google.rw' },
    { 0, 184, 'google.com.sa' },
    { 0, 184, 'google.com.sb' },
    { 0, 184, 'google.sc' },
    { 0, 184, 'google.se' },
    { 0, 184, 'google.com.sg' },
    { 0, 184, 'google.sh' },
    { 0, 184, 'google.si' },
    { 0, 184, 'google.sk' },
    { 0, 184, 'google.com.sl' },
    { 0, 184, 'google.sn' },
    { 0, 184, 'google.sm' },
    { 0, 184, 'google.so' },
    { 0, 184, 'google.st' },
    { 0, 184, 'google.sr' },
    { 0, 184, 'google.com.sv' },
    { 0, 184, 'google.td' },
    { 0, 184, 'google.tg' },
    { 0, 184, 'google.co.th' },
    { 0, 184, 'google.com.tj' },
    { 0, 184, 'google.tk' },
    { 0, 184, 'google.tl' },
    { 0, 184, 'google.tm' },
    { 0, 184, 'google.to' },
    { 0, 184, 'google.tn' },
    { 0, 184, 'google.com.tr' },
    { 0, 184, 'google.tt' },
    { 0, 184, 'google.com.tw' },
    { 0, 184, 'google.co.tz' },
    { 0, 184, 'google.com.ua' },
    { 0, 184, 'google.co.ug' },
    { 0, 184, 'google.co.uk' },
    { 0, 184, 'google.com.uy' },
    { 0, 184, 'google.co.uz' },
    { 0, 184, 'google.com.vc' },
    { 0, 184, 'google.co.ve' },
    { 0, 184, 'google.vg' },
    { 0, 184, 'google.co.vi' },
    { 0, 184, 'google.com.vn' },
    { 0, 184, 'google.vu' },
    { 0, 184, 'google.ws' },
    { 0, 184, 'google.co.za' },
    { 0, 184, 'google.co.zm' },
    { 0, 184, 'google.co.zw' },
    { 0, 184, 'google.net' },
    -- Gmail
    { 0, 655, 'mail.google.com' },
    { 0, 655, 'gmail.com' },
     -- Airtime
    { 0, 1645, 'www.airtime.com' },
    -- CSDN
    { 0, 1646, 'passport.csdn.net' },
    { 0, 1646, 'passport.pongo.cn' },
    -- Taringa
    { 0, 1647, 'www.taringa.net' },
    { 0, 1647, 'taringa.net' },
    -- Aliexpress
    { 0, 1648, 'aliexpress.com' },
    -- 58 City
    { 0, 1649, 'passport.58.com' },
    -- Rakuten
    { 0, 1652, 'rakuten.co.jp' },
    -- Snapchat
    { 1, 1653, 'feelinsonice.appspot.com' },
    { 1, 1653, 'feelinsonice-hrd.appspot.com' },
    -- 500px
    { 1, 1654, '500px.com' },
    -- Airbnb
    { 0, 1655, 'airbnb.com' },
    -- Invitemedia
    { 0, 1656, 'www.invitemedia.com' },
    { 0, 1656, 'invitemedia.com' },
    -- Urban Airship
    { 0, 1657, 'urbanairship.com' },
    -- Akamai
    { 0, 1659, 'akamaihd.net'},
    { 0, 1659, 'akamai.net'},
    { 0, 1659, 'akamai.com'},
    -- Loyalty Innovations
    { 0, 1660, 'loyaltyinnovations.com'},
    -- Odnoklassniki
    { 0, 1070, 'odnoklassniki.ru'},
    -- Avaya Live
    { 1, 1661, 'avayalive.com'},
    -- Facebook
    { 0, 629, 'fbcdn-photos-a.akamaihd.net'},
    { 0, 629, 'fbcdn-photos-e-a.akamaihd.net'},
    { 0, 629, 'fbcdn-photos-b-a.akamaihd.net'},
    { 0, 629, 'fbcdn-video-a.akamaihd.net'},
    { 0, 629, 'www.facebook.com'},
    { 0, 629, 'facebook.com'},
    { 0, 629, 'fbcdn-sphotos-e-a.akamaihd.net'},
    { 0, 629, 'fbcdn-sphotos-b-a.akamaihd.net'},
    { 0, 629, 'fbstatic-a.akamaihd.net'},
    { 0, 629, 'fbexternal-a.akamaihd.net'},
    { 0, 629, 'fbcdn-sphotos-f-a.akamaihd.net'},
    { 0, 629, 'fbcdn-profile-a.akamaihd.net'},
    { 0, 629, 'fbcdn-creative-a.akamaihd.net'},
    { 0, 629, 'channel.facebook.com'},
    { 0, 629, 'fbcdn-dragon-a.akamaihd.net'},
    { 0, 629, 'contentcache-a.akamaihd.net'},
    { 0, 629, 'facebook.net'},
    { 0, 629, 'fbcdn.net'},
    -- Dwolla
    { 0, 1664, 'www.dwolla.com'},
    -- Google Remote Desktop
    { 1, 1665, 'chromoting-oauth.talkgadget.google.com'},
    { 1, 1665, 'chromoting-host.talkgadget.google.com'},
    { 1, 1665, 'chromoting-client.talkgadget.google.com'},
    { 1, 1665, 'remoting-pa.googleapis.com'},
    { 1, 1665, 'talk.google.com'},
    -- Official Major League Baseball
    { 0, 1385, 'mlb.com'},

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

