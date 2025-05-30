## [9.0.1]

* [iOS][macOS] bumped AppAuth iOS dependency to 2.0.0

## [9.0.0]

* **Breaking change** updated minimum supported SDK version to Flutter 3.19/Dart 3.3
* [Android] **Breaking changes** updated `compileSdkVersion` to 33 and AGP to 8.0.1 to align with what's used by the AppAuth Android SDK
* [iOS][macOS] added Swift Package Manager support
* [iOS][macOS] **Breaking changes** a number of Objective-C headers that were public are now no longer public. This means that classes were defined on the native side of the plugin may now no longer visible. These changes likely don't affect users of the plugin as this is to do with APIs that can be accessed via Objective-C or Swift. These changes were done to add Swift Package Manager support
* Migrated Android side of example to use plugin DSL
* Bumped `flutter_lints` dev dependency
* Fixed typo in the code snippet shown in the **End session** section of the readme. Thanks to the PR from [barryguvenkaya](https://github.com/barryguvenkaya)
* Updated readme to add a table of contents
* Updated links to tutorials associated with identity providers. The Auth0 one has been removed as their tutorial has changed to use a different SDK. A disclaimer has been added to warn that the content is managed by external parties and may also be out of date

## [8.0.2]

* [iOS][macOS] bumped AppAuth iOS dependency to 1.7.6
* [iOS][macOS] **BAD** added Swift Package Manager support but "local" testing didn't uncover. This has been reverted by 8.0.3

## [8.0.1]

* Fixed issue [568](https://github.com/MaikuB/flutter_appauth/issues/568) where compilation could fail with a `'OIDExternalUserAgent.h' file not found` error

## [8.0.0+1]

* Updated 8.0.0 as it was missing mention of the privacy manifest file to the macOS implementation of the plugin

## [8.0.0]

* **Breaking change** Replaced the `preferEphemeralSession` property in the `AuthorizationRequest`, `AuthorizationTokenRequest` and  `EndSessionRequest` classes with `externalUserAgent`. Thanks to the PR from [john-slow](https://github.com/john-slow). `externalUserAgent` is presented by the newly `ExternalUserAgent` enum that has the following values
    * `asWebAuthenticationSession`: uses the [ASWebAuthenticationSession](https://developer.apple.com/documentation/authenticationservices/aswebauthenticationsession) APIs where possible. This is the default value and was the default behaviour behaviour that aligns with what the AppAuth iOS SDK would do in choosing the best available user-agent
    * `ephemeralAsWebAuthenticationSession`: uses an ephemeral session via the [ASWebAuthenticationSession](https://developer.apple.com/documentation/authenticationservices/aswebauthenticationsession) APIs. Applications that previously used `preferEphemeralSession` and specified to be `true` can migrate by specifying this enum value
    * `sfSafariViewController`: uses the [SFSafariViewController](https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller) APIs
* Updated iOS plugin details to indicate it needs a minimum iOS version of 11.0. This aligns with the minimum best supported version for Flutter 3.13.0
* Updated macOS plugin details to indicate it needs a minimum iOS version of 10.14. This aligns with the minimum best supported version for Flutter 3.13.0
* [Android] some refactoring around code related to `allowInsecureConnections` has been done in response to issue [554](https://github.com/MaikuB/flutter_appauth/issues/554)
* [Android] added logic to help with issues like [205](https://github.com/MaikuB/flutter_appauth/issues/205) where an app tries to refresh a token but the instances of `AuthorizationService` have been disposed
* [macOS] added privacy manifest file

# 7.0.1

* [iOS] correctly bumped AppAuth iOS dependency to 1.7.5. The 7.0.0 release mistakenly only bumped the dependency for macOS

# 7.0.0

* **Breaking change** Bumped minimum Flutter and Dart SDK constraints to 3.13.0 and 3.1.0 respectively
* **Breaking change** all methods have now been made to return non-nullable types
* [macOS] bumped AppAuth iOS dependency to 1.7.5
* Updated error handling to expose more details for each platform. Plugin will now throw `FlutterAppAuthUserCancelledException` when an authorization request has been cancelled as a result of the user closing the browser. For other scenarios the plugin will throw `FlutterAppAuthPlatformException`. See the API docs for both classes for more details on the available details. Both exception classes inherit from `PlatformException` so the changes should be backwards compatible
* Updated readme with more details on essential knowledge and links to OAuth 2.0 specifications

# 6.0.7

* [Android] updated plugin to specify `Theme.AppCompat.Translucent.NoTitleBar` as the theme for the `RedirectUriReceiverActivity` from the AppAuth Android SDK. This is to fix a crash raised with issues [#362](https://github.com/MaikuB/flutter_appauth/issues/362) and [#515](https://github.com/MaikuB/flutter_appauth/issues/515)

# 6.0.6

* [iOS][macOS] bumped AppAuth iOS dependency to 1.7.4

# 6.0.5

* [iOS] bumped AppAuth iOS dependency to 1.7.2

# 6.0.4

* [Android] when no suitable browser is found when calling either `authorize()` or `authorizeAndExchange()`, rather than crashing the plugin will now throw a `PlatformException` with an error code of `no_browser_available`. Thanks to the PR from [NikHomann](https://github.com/NikHomann)
* Removed duplicate asterisk from the 6.0.3 changelog entry around how the example app got updated

# 6.0.3

* [Android] community has reported that there seem to be instances where the plugin encounters a null intent on some devices upon processing a end session request. This resulted in a crash before but will now throw a `PlatformException`. Thanks to the PR from [John](https://github.com/JohnKim7)
* Updated example app so that the Android side specifies the minimum SDK version version that aligns with what's specified by the Flutter SDK

# 6.0.2+1

* [iOS] added privacy manifest

# 6.0.2

* [macOS] fixed deprecation warning around using `init` and to use `initWithPresentingWindow` via the AppAuth iOS/macOS SDK instead. Thanks to the PR from [Ivan Tivonenko](https://github.com/darkdarkdragon)

# 6.0.1

* [iOS] updated plugin so it supports apps that leverage the multiple window capability that Apple added to iOS 13. Thanks to the PR from [Jerold Albertson](https://github.com/jeroldalbertson-wf)
* Added a link to the tutorials section of the readme that walks through how to use this plugin with Asgardeo. Thanks to the PR from [Achintha Isuru](https://github.com/Achintha444)

# 6.0.0

* **Potentially breaking change** [iOS][macOS] bumped AppAuth dependency to 1.6.2 where fixes were done to allow SDK to compile in Xcode 14 by bumping the minimum OS versions
* Bumped maximum Dart SDK constraint
* Recreated iOS and macOS side of example app so it would work with new Flutter 3.10 stable release


## 5.0.0

* **Breaking change** Bumped minimum Flutter SDK version to 3.0.0 and Dart SDK version to 2.17
* [Android] removed references to v1 embedding
* [Android] updated `compileSdkVersion` to 31 (Android 12)
* [Android] bumped AGP (Android Gradle plugin) to 7.4.2
* [Android] conditionally adds a namespace for compatibility with AGP 8.0
    * Note: it's quite likely that the AppAuth Android SDK itself requires this change going forward but this change will ensure that the `flutter_appauth` plugin has done this change ahead of time
* Applied following updates to the example app on the Android side
    * Bumped AGP to 7.4.2 and Gradle 7.5
    * Used namespace instead of package identifier since the latter has been deprecated (reference: https://developer.android.com/build/releases/past-releases/agp-7-3-0-release-notes#package-deprecated). Note that as of this writing, using the `flutter run` command on the stable channel (i.e. Flutter version 3.7.1) to debug/run the app will in an error that says "package identifier or launch activity not found". However, an APK or app bundle can still be built and will run on a device. The Flutter team have already addressed this issue on the master channel that is currently on version 3.10.0-17.0.pre.21 so would expect the next stable release to contain the fix. Alternatively developers can manually restore the package identifier though this change was done to avoid issues from happening in the future

## 4.2.1+1

* Added comments to example app to explain how code challenge takes place per PKCE. Thanks to PR from [Davide Ravasi](https://github.com/davideravasi)
* Updated code for API docs to avoid lines longer than 80 characters

## 4.2.1

* [iOS][macOS] bumped AppAuth dependency to 1.6.0

## 4.2.0

* Added `preferEphemeralSession` to `EndSessionRequest` Thanks to the PR from [Daniel Ziegler](https://github.com/ziegler-daniel)

## 4.1.0+1

* Added missing credit to 4.1.0 changelog entry
* Updated readme to remove Android setup step for setting `queries` in `AndroidManifest.xml` as that is now handled directly with the AppAuth Android SDK

## 4.1.0

* Added ability to specify the `nonce` as part of requests. Thanks to the PR from [Tiernan](https://github.com/nvx)

## 4.0.1

* Bumped AppAuth iOS dependency. Thanks to PR from [Didier Prophete](https://github.com/dprophete)

## 4.0.0

* Added support for macOS. Thanks to the PR from [Jordy Langen](https://github.com/JordyLangen)

## 3.0.1

* [iOS] fix `nonce` not being returned correctly on iOS

## 3.0.0

* **Breaking change** `AuthorizationResponse`'s  constructor now includes `nonce` and has changed to take positional parameters
* `nonce` can now be specified for `TokenRequest` class. This is especially useful on Android as the AppAuth Android SKD had turned on ID token validation that results in nonce mismatch errors. These errors should no longer appear when using the `nonce` value returned by the `AuthorizationResponse` object after calling `authorize()` and passing the value to the `TokenRequest` when calling the `token()` method
* Bumped AppAuth Android SDK to 0.11.1 where the SDK reports that it has fixed an [issue](https://github.com/openid/AppAuth-Android/issues/769) where rotating device could lead to the SDK reporting that the user cancelled login flow

## 2.4.2

* Added const constructor to `FlutterAppAuth`

## 2.4.1+1

* Example app has been updated to point to the new demo IdentityServer instance

## 2.4.1

* [iOS] fixed issue with `scopes` not being sent correctly as they should've been space-delimited instead of comma-delimited. Thanks to the PR from [Angle Wang](https://github.com/angle319)

## 2.4.0

* Added `scopes` property to `TokenResponse` class and `AuthorizationTokenResponse` class that inherits from it. Thanks to PR from [leoshusar](https://github.com/leoshusar)
* [Android] applied fix to a scenario where skipping https check on the issuer wasn't done for refreshing tokens. Thanks to the PR from [Javier Puerto](https://github.com/jpuerto)

## 2.3.0

* [Android] `claims` can now be passed as part of the `additionalParameters` included with requests without triggering an exception by the AppAuth Android SDK. Thanks to the PR from [Garry Jeromson](https://github.com/garry-jeromson)

## 2.2.0+1

* Updated Android setup section in the readme around setting the redirect scheme via manifest placeholders. If you've experienced Android build errors that says `applicationName` can't be found then check the readme for updated instructions, which is to use the `+=` operation instead of `=` on the `manifestPlaceholders` property in the `build.gradle` file

## 2.2.0

* [Android] updated error handling so more details are returned. Thanks to [Andreas Kägi](https://github.com/akaegi) for originally starting on the PR

## 2.1.0+1

* Fix grammar in 2.1.0 changelog entry

## 2.1.0

* [Android] `ui_locales` can now be passed as part of the `additionalParameters` included with requests without triggering an exception by the AppAuth Android SDK. Thanks to the PR from [dimitristoz](https://github.com/dimitristoz)

## 2.0.0

* **Breaking change** `AuthorizationServiceConfiguration` constructor has changed to take named parameters
* Added `endSession()` method, `EndSessionRequest` and `EndSessionResponse` classes to support end session requests
* [Android] skips https issuer check if `allowInsecureConnections` is true. Thanks to the PR from [Roman Fürst](https://github.com/rfuerst87)
* Bumped AppAuth Android and iOS SDK dependencies
* Added FAQs section to readme to describe a common iOS issue with Azure B2C and Azure AD

## 1.1.1

* [Android] Migrate maven repository from jcenter to mavenCentral.

## 1.1.0+2

* Bumped AppAuth Android and iOS dependencies

## 1.1.0+1

* Updated the minimum version iOS supported by the example app to 9.0 since Flutter 2.5 has deprecated support for 8.0

## 1.1.0

* * Added the ability to specify the response mode for authorization requests. This can be done using the `responseMode` parameter  when constructing either an `AuthorizationRequest` or `AuthorizationTokenRequest`. This was done as the AppAuth Android SDK throws an exception when this was done via `additionalParameters`
* Updated Dart SDK constraints

## 1.0.0+1

* There are no functional changes in this release. The only changes done were to suppress warnings that were occurring as a result of making use of Android v1 embedding APIs for backwards compatibility

## 1.0.0

* Migrated to null safety

## 0.9.2+6

* [Android] community has reported that there seem to be instances where the plugin encounters a null intent on some devices upon processing a authorisation request. This resulted in a crash before but will now throw a `PlatformException`. Thanks to the PR from [Leon Havenga](https://github.com/li0nza)

## 0.9.2+5

* Updated the Android setup section in the readme to include information for apps targeting Android 11 (API 30) or newer
* [Android] bumped compile SDK version for the plugin to 30
* Updated example app to use compile and target SDK version 30

## 0.9.2+4

* [Android] fix issue [131](https://github.com/MaikuB/flutter_appauth/issues/131) where setting the `allowInsecureConnections` flag to true whilst doing an authorisation or token request didn't behave as expected. Thanks to the PR from [Hongxu Xu](https://github.com/xuhongxu96)

## 0.9.2+3

* [Android] fix issue [79](https://github.com/MaikuB/flutter_appauth/issues/79) where an authorisation request could cause the UI to momentarily hang due to AppAuth trying to warm up the browser

## 0.9.2+2

* Updated example app to use a new client id that works with the demo IdentityServer instance

## 0.9.2+1

* Updated readme to add a link to Auth0 blog post and mention that the value assigned to `appAuthRedirectScheme` within the Android application's `build.gradle` file should be all in lowercase

## 0.9.2

* [iOS] Fixes release build issue about including a non-modular header that came about from release 0.9.1+1. If you experienced issues with 0.9.1+1 (in my experience only occurs if your iOS app uses Swift), please update to 0.9.2

## 0.9.1+1

* Fixes warnings picked up in Xcode raised in issue [123](https://github.com/MaikuB/flutter_appauth/issues/123)

## 0.9.1

* [iOS] Update AppAuth SDK dependency to 1.3.1

## 0.9.0

* Bumped dependency on `flutter_appauth_platform_interface`
* [iOS] The `preferEphemeralSession` property has been added to the `AuthorizationRequest` and `AuthorizationTokenRequest` classes. This enables authorization requests to be done a in private session that won't share cookies and other data with the user's regular browser. This property only works when run on iOS versions 13 and above. Thanks to the PR from [Matthew Smith](https://github.com/matthewtsmith)
* **BREAKING CHANGE** bumping the `flutter_appauth_platform_interface` dependency includes the removal of the `toMap` method from all classes. These methods were used internally by plugin and thus have been removed
* **BREAKING CHANGE** Bumped Gradle plugin to 3.6.3

## 0.8.3

* [Android] Fixed an issue where a `NullPointerException` could occur when too many operations are started at one time. Thanks to the PR from [Josh Burton](https://github.com/athornz)

## 0.8.2

* [Android] Fixed issue [98](https://github.com/MaikuB/flutter_appauth/issues/98) where certain exceptions on Android could prevent the plugin from being able to perform more operations

## 0.8.1

* Bump dependency on `flutter_appauth_platform_interface` to take in fix for casting error that could apply upon calling `token()` method

## 0.8.0

* Migrated plugin to use platform interface
* [Android] Support v2 Android embedding. Example app has been updated accordingly
* **BREAKING CHANGE** removed name constructor from `FlutterAppAuth` class that visible for testing
* **BREAKING CHANGE** when grant type cannot be inferred, this now throws an `ArgumentError` instead of a string containing the error message
* Fixed some formatting issues in the changelog

## 0.7.0+1

* Fix code snippet in readme where the variable for saving the result of the `token()` method should have been of type `TokenResponse` (issue [74](https://github.com/MaikuB/flutter_appauth/issues/74)). Thanks to PR from [Stephen Owens](https://github.com/sowens-csd).

## 0.7.0

* Add minimum version of Flutter (1.12.13+hotfix.5) to address `MissingPluginException` raised issue [66](https://github.com/MaikuB/flutter_appauth/issues/66)
* Update pubspec file of example app to reference plugin in the `dependencies` section instead of `dev_dependencies` to avoid confusion
* Update changelog for 0.6.0 where the minimum Flutter version should have been added

## 0.6.0+1

* Correct changelog entry for 0.6.0 release. Previously reported plugin updated to use Gradle plugin 3.5.2 but should have written 3.5.3

## 0.6.0

* [Android] **BREAKING CHANGE** Bump Gradle plugin to 3.5.3
* [iOS] Fix issue [63](https://github.com/MaikuB/flutter_appauth/issues/63) where `login_hint` and `promptValues` was only passed when using service discovery
* Update pubspec to match latest version of pub
* *NOTE*: this release actually requires updating the latest Flutter stable release (1.12) but missed enforcing it in this release. If you run into a `MissingPluginException` from using this version, please update your Flutter SDK.

## 0.5.0

* [Android] **BREAKING CHANGE** Bump compile and target SDK versions to 29
* [Android] **BREAKING CHANGE** Bump Gradle plugin to version 3.5.2
* Bump example app to use Gradle distribution version 5.4.1

## 0.4.2

* [iOS] Update AppAuth SDK dependency to 1.2 so it works on iOS 13. Thanks to the PR from [Aynur Dinmukhametov](https://github.com/ARDcode)

## 0.4.0+1

* Make it clearer in the readme that AndroidX is required

## 0.4.0

* [iOS] Update AppAuth SDK dependency to 1.1
* Update email address in pubspec.yaml
* Add `GrantTypes` class as a convenience for other developers to use
* **BREAKING CHANGE** `authorize` method has been corrected to accept an instance of the `AuthorizationRequest` class as opposed to an instance of the `AuthorizationTokenRequest` class even though a token isn't being requested

## 0.3.0+1

* Update email address in pubspec.yaml

## 0.3.0

* [iOS] Explicitly set to depend on version 1.0 of the AppAuth iOS SDK
* Added Cirrus CI configuration

## 0.2.1+2

* Updated README to fix section on refreshing tokens where `authorizationCode` was shown in code snippet by mistake

## 0.2.1+1

* Updated README to add a note suggesting developers to check the documentation of the identity provider they plan to use

## 0.2.1

* [iOS] Fix issue with `login_hint` OAuth parameter (specified by the `loginHint` field of the `AuthorizationTokenRequest` and `AuthorizationRequest` classes). Example app has also been updated to demonstrate how to specify it
* Added support for specifying the `prompt` OAuth parameter. This can be specified by populating the `promptValues` field in the either the `AuthorizationTokenRequest` or `AuthorizationRequest` class. Updated example app (note: code is commented out) to demonstrate how to use it

## 0.2.0

* **BREAKING CHANGE** Updated the Android Gradle plugin to version 3.4.0. Applies to both the library and sample app
* Updated README with a note for developers to check to see if their development environment on the Android is up to date as this should now be fixed with the release of Android Studio 3.4
* Updated the Gradle distribution used by the example app to 5.1.1

## 0.1.1

* Changed the request codes used internally on the Android side to be less than 16 bits. Thanks to the PR from [Dviejopomata](https://github.com/Dviejopomata)

## 0.1.0

* **BREAKING CHANGE** Updated lower bound of the Dark SDK constraints from 2.0.0-dev.68.0 to 2.1.0
* Added more details to the error messages when platform exceptions are raised e.g. when problems occur exchanging the authorization code. Note that there will be differences in the level of details that will be returned on each platform. This is due the differences between the SDKs on each platform

## 0.0.4+1

* No functional changes in this release. Just remove old comment in the code and changes to format the README more nicely

## 0.0.4

* **BREAKING CHANGE** renamed `authorizeAndExchangeToken` method to `authorizeAndExchangeCode` to reflect what happens behind the scenes
* Added an `authorize` method that performs an authorization request to get an authorization code without exchanging it
* Updated README and sample code to demonstrate the use of the `authorize` method, how to exchange the authorization code for tokens and how to perform an authorization request that will retrieve the disocvery document with an issuer instead of the full discovery endpoint URL.

## 0.0.3+1

* Fix code around inferring grant type.
* Update plugin description

## 0.0.3

* Fix to infer grant type based on what is provided when creating a token request (currently only refresh token is supported);
* Update README to include link to https://appauth.io
* Update example to include (commented out) code where the authorization and token endpoints can be explicit set instead of relying on discovery to fetch those endpoints

## 0.0.2+1

* Switch example to connect to test instance of IdentityServer4

## 0.0.2

* Fix error when either `discoveryUrl` or `issuer` has been passed to the `AuthorizationTokenRequest` constructor

## 0.0.1+1

* Update the README to add sections for setting up on Android and iOS

## 0.0.1

* Initial release of the plugin.
