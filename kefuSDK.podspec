Pod::Spec.new do |s|
    s.name          = "kefuSDK"
    s.version       = "1.0.3"
    s.summary       = "环信客服 SDK"
    s.homepage      = "https://github.com/easemob/helpdeskdemo-ios"
    s.license       = { :type => "MIT", :file => "LICENSE" }
    s.platform      = :ios, "8.0"
    s.author        = { "afanda" => "fan_apple1990@163.com" }
    s.source        = { :git => "https://github.com/easemob/helpdeskdemo-ios.git", :tag => s.version }
    s.requires_arc  = true
    s.public_header_files = "CustomerSystem-ios/HelpDeskSDK/helpdesk_sdk.h"
    s.source_files = "CustomerSystem-ios/HelpDeskSDK/helpdesk_sdk.h"
    s.frameworks    = "CoreMedia","AudioToolbox","AVFoundation","ImageIO","MobileCoreServices"
    s.libraries     = "c++","z","sqlite3","stdc++.6.0.9"
    s.xcconfig      = {"OTHER_LDFLAGS" => "-ObjC"}
    s.subspec 'include' do |ss|
        ss.source_files = 'CustomerSystem-ios/HelpDeskSDK/include/*.h'
        ss.public_header_files = 'CustomerSystem-ios/HelpDeskSDK/include/*.h'
    end
    s.subspec 'lib' do |ss|
        ss.source_files = 'CustomerSystem-ios/HelpDeskSDK/lib/libhelpdesk_sdk.a'
    end
end
