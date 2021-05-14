Pod::Spec.new do |spec|
    spec.name = 'CardIO'
    spec.version = '1.0.0'
    spec.summary = 'Revolut - CardIO'
    spec.description = 'Revolut - CardIO'
    spec.homepage = 'https://www.revolut.com'
    spec.source = { :git =>'https://www.revolut.com' }
    spec.license = { :type => 'Proprietary' }
    spec.author = { 'Revolut' => 'team@revolut.com' }
    spec.static_framework = true

    spec.ios.deployment_target = '10.0'
    spec.source_files = [
        'CardIOCardholderNameTextFieldDelegate.{h,m}',
        'Classes/**/*.{h,m,mm}',
        'CardIO_Public_API/**/*.h',
        'dmz/dmz_all.cpp',
        'dmz/mz_ios.mm',
    ]
    spec.prefix_header_file = 'SupportFiles/CardIO-Prefix.pch'
    spec.pod_target_xcconfig = {
        'HEADER_SEARCH_PATHS' => '${SRCROOT}/../dmz ${SRCROOT}/../dmz/cv ${SRCROOT}/../dmz/scan ${SRCROOT}/../dmz/models/generated ${SRCROOT}/../dmz/models/expiry',
        'OTHER_CPLUSPLUSFLAGS' => '$(OTHER_CFLAGS) -Wno-c++11-narrowing',
    }
    spec.public_header_files = 'CardIO_Public_API/**/*.h'
    spec.frameworks = 'Accelerate', 'AVFoundation', 'AudioToolbox', 'CoreMedia', 'CoreVideo', 'MobileCoreServices', 'OpenGLES', 'QuartzCore', 'Security', 'UIKit'
    spec.libraries = 'c++'
    spec.dependency 'OpenCV', '~> 4.0'

    # For optimal performance the sample app should better be run in release configuration
    #
    # For runnning on a device it is neccessary to setup a development team in the app target,
    # inside the Pods project
    spec.app_spec 'icc' do |app_spec|
        app_spec.frameworks = 'Accelerate', 'AVFoundation', 'AudioToolbox', 'CoreMedia', 'MobileCoreServices'
        app_spec.pod_target_xcconfig = {
            'GCC_PREPROCESSOR_DEFINITIONS' => 'CARDIO_DEBUG=1 USE_CAMERA=1 DMZ_DEBUG=1 TEST_GENERATED_MODELS=1',
        }
        app_spec.source_files = [
            'ClassesSampleApp/**/*.{m,swift}',
            'dmz/models/TestGeneratedModels.h',
            'dmz/models/TestGeneratedModels.mm',
        ]
        app_spec.resources = [
            'Resources/**/*',
            'ClassesSampleApp/**/*.xib',
        ]
        app_spec.pod_target_xcconfig = { 'INFOPLIST_FILE' => '${PODS_TARGET_SRCROOT}/icc-Framework-Info.plist' }
    end
end
