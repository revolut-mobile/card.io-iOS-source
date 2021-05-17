platform :ios, '10.0'

use_frameworks!
inhibit_all_warnings!

install! 'cocoapods', :share_schemes_for_development_pods => true

xcodeproj 'CardIO.xcodeproj'
workspace 'CardIO.xcworkspace'

target 'Dummy' do
end

pod 'OpenCV', :path => '.'
pod 'CardIO', :path => '.', :appspecs => ['icc']