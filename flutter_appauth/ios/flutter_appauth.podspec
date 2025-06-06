#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_appauth'
  s.version          = '0.0.1'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'flutter_appauth/Sources/flutter_appauth/**/*.{h,m}'
  s.public_header_files = 'flutter_appauth/Sources/flutter_appauth/include/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'AppAuth', '2.0.0'
  s.ios.deployment_target = '12.0'
  s.resource_bundles = {'flutter_appauth_privacy' => ['flutter_appauth/Sources/flutter_appauth/PrivacyInfo.xcprivacy']}
end

