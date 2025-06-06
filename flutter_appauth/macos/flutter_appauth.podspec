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
  s.dependency 'FlutterMacOS'
  s.dependency 'AppAuth', '2.0.0'
  s.platform = :osx, '10.14'
  s.osx.deployment_target = "10.14"
  s.resource_bundles = {'flutter_appauth_privacy' => ['flutter_appauth/Sources/flutter_appauth/PrivacyInfo.xcprivacy']}
end
