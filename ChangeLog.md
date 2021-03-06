2017-01-13  Version 1.0.0

  * Support for react-native 0.40.0
  * Configuration changes to support various toolchains
  * Full support for Carthage

2017-01-31  Version 0.9.1

  * Fixed unsubscribe bug (#73)
  * Full support for Carthage
  * Support all parameters of Branch Universal Object and link properties

2017-01-31  Version 1.0.1

  * Fixed unsubscribe bug (#73)
  * Support all parameters of Branch Universal Object and link properties

2017-02-06  Version 0.9.2

  * Corrected peerDependencies

2017-02-06  Version 1.0.2

  * Corrected peerDependencies
  * Fixed [an issue](https://github.com/BranchMetrics/react-native-branch-deep-linking/pull/93) that prevented App Store submission

2017-02-15  Version 0.9.3

  * Reduced iOS deploy target from 9.2 to 8.0.

2017-02-15  Version 1.0.4

  * Reduced iOS deploy target from 9.2 to 8.0.

2017-02-24  Version 0.9.5

  * Improved support for manual installation of Branch SDK
  * Fix for non-Branch links with Universal Links on iOS

2017-02-24  Version 1.0.5

  * Improved support for manual installation of Branch SDK
  * Fix for non-Branch links with Universal Links on iOS

2017-03-16  Version 0.9.6

  * Corrected a react-native version limitation in the build.gradle to ensure the version from node_modules is used.

2017-03-16  Version 1.1.0

  * This release introduces a userCompletedAction() method on the Branch Universal Object. The registerView() method
  is deprecated in favor of userCompletedAction(RegisterViewEvent).
  * The createBranchUniversalObject() method now allocates native resources supporting the BUO. These are eventually
  cleaned up when unused for some time. An optional release() method is also provided to ensure they are released
  immediately, e.g. when componentWillUnmount() is called.
  * Corrected a react-native version limitation in the build.gradle to ensure the version from node_modules is used.
  * The native iOS dependencies for the testbed apps were updated to 0.13.5.

2017-03-21  Version 0.9.7

  * Decrease buildToolsVersion to 23.0.1 in build.gradle

2017-03-21  Version 1.1.1

  * Decrease buildToolsVersion to 23.0.1 in build.gradle
  * Fixed broken Carthage build (#128)
  * Updated README to reflect async createBranchUniversalObject method.

2017-03-23  Version 2.0.0-beta.1

  * Reduce the number of manual steps required to get started.
  * Remove any need for CocoaPods, Carthage or manual iOS SDK installation in a React Native app.
  * Pin to specific versions of the native SDKs to avoid issues arising from version mismatches.
  * Fully support integration of react-native-branch in a React Native component within a native
    app that also uses the native Branch SDK.
  * Includes native SDKS 0.13.5 (iOS), 2.5.9 (Android)

  See [Release 2.0.0](https://github.com/BranchMetrics/react-native-branch-deep-linking/blob/master/docs/Release-2.0.0.md) for more details.

2017-04-24  Version 2.0.0-beta.2

  * Implemented an RCTEventEmitter in iOS.
  * Rebuilt JS link caching to address #79.
  * Corrected link property mappings on Android (thanks to @jchesne for the PR).
  * Includes native SDKs 0.14.12 (iOS), 2.6.1 (Android).
  * Added missing AddToCartEvent, listed in the docs.
  * Export event constants from the native layer for better consistency.
  * Support for routing links in native Android apps that include RN components.
  * Added/improved example applications. The master branch includes five examples for 2.0.0:
    - testbed_simple
    - testbed_native_ios
    - testbed_native_android
    - webview_example
    - webview_native_ios
    As well as the two legacy examples testbed_carthage and testbed_cocoapods for 1.1. The
    webview_example and webview_example_native_ios apps are complete, practical examples of
    content-sharing apps that route links and follow Branch's best practices. All examples
    are fully set up for the bnctestbed.app.link domain.
  * All 2.0 examples now include support for both the test and live Branch keys. All Android
    examples will use the test key in Debug builds and the live key in Release builds. This
    is also true for testbed_simple and webview_example. testbed_native_ios and
    webview_example_native_ios use custom build configurations and schemes to differentiate
    the live and test environments (this approach is only possible when using CocoaPods on iOS;
    it is easily arranged using productFlavors on Android and very similar to the existing
    setup).
  * Added an experimental Fastlane plugin to set up example apps for iOS without using Xcode
    to make it easy to run them on a device and test link routing.
  * Greatly expanded CI and unit testing, including native unit tests, for improved stability.

2017-04-26  Version 2.0.0-beta.3

  * This release fixes an Android crash introduced in 2.0.0-beta.2. (#187)
  * Includes native SDKs 0.14.12 (iOS), 2.6.1 (Android).

2017-05-10  Version 2.0.0-beta.4

  * This release restores the React dependency to the react-native-branch podspec for full
    Swift support.
  * Improvements to webview_example_native_ios to take advantage of full Swift support.
  * Includes native SDKs 0.14.12 (iOS), 2.6.1 (Android).

2017-05-19  Version 2.0.0-beta.5

  * This release disables the unsupportable `setDebug()` method and provides new native methods to
    take its place. See https://rnbranch.app.link/hGj7E61EhD for details.
  * Removed the filter in the native layers that was passing null `params` to the `branch.subscribe` callback.
    Now `params` will never be null in the callback. Non-Branch links are
    available using the `+non_branch_link` parameter, like the rest of Branch's SDKs. See in particular the
    webview_example for updated usage. The `uri` parameter still exists, and its behavior is largely unchanged, but
    it should now be considered deprecated and will be removed in a future release.
  * Includes native SDKs 0.14.12 (iOS), 2.8.0 (Android).

2017-05-30  Version 2.0.0-beta.6

  * This release adds some native wrapper methods to simplify certain native code changes that cannot
    be supported in JS.
  * Includes native SDKs 0.15.3 (iOS), 2.8.0 (Android).

2017-06-19  Version 2.0.0-beta.7
  * This release adds support for an optional `branch.json` configuration file. See https://rnbranch.app.link/branch-json for details.
  * Deprecated `[RNBranch handleDeepLink:]`. See https://rnbranch.app.link/version-2#ios-api-changes for details.
  * Includes native SDKs 0.15.3 (iOS), 2.9.0 (Android).

2017-08-04  Version 2.0.0-beta.8
  * Support for RN >= 0.47 (#231).
  * Added support for platform-specific branch.json.
  * Includes native SDKs 0.16.2 (iOS), 2.10.3 (Android).

2016-08-17  Version 2.0.0-rc.1
  * (Internal) Native SDK updates are now automated.
  * Includes native SDKs 0.17.9 (iOS), 2.11.1 (Android).

2016-08-21  Version 2.0.0-rc.2
  * Fixed automation bug that generated an RNBranch.xcodeproj that failed with `react-native link`.
  * Regenerated RNBranch.xcodeproj to fix `react-native link` bug (#239).
  * Includes native SDKs 0.17.9 (iOS), 2.11.1 (Android).

2016-08-30  Version 2.0.0
  * Added sendCommerceEvent method.
  * Complete rewrite of the README.
  * Removed the peerDependency on `react`.
  * Includes native SDKs 0.17.10 (iOS), 2.12.0 (Android).

2015-10-02  Version 2.1.0
  * Added an openURL method for programmatic deep linking from anywhere in an app (e.g., a QR reader).
  * Allow loading rewards from different buckets via an optional argument to loadRewards().
  * Return RNBranch::Error::DuplicateResourceError in case of an existing alias.
  * Further rework of the README.
  * Introduced a tutorial app.
  * Includes native SDKs 0.19.5 (iOS), 2.12.1 (Android).
