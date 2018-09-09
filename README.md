# XestiNotify

[![Swift 4.x](https://img.shields.io/badge/Swift-4.x-orange.svg)](https://developer.apple.com/swift/)
[![License](https://img.shields.io/cocoapods/l/XestiNotify.svg)](http://cocoapods.org/pods/XestiNotify)
[![Platform](https://img.shields.io/cocoapods/p/XestiNotify.svg)](http://cocoapods.org/pods/XestiNotify)

[![Build Status](https://img.shields.io/travis/eBardX/XestiNotify/master.svg?colorB=4BC51D)](https://travis-ci.org/eBardX/XestiNotify)
[![Code Coverage](https://img.shields.io/codecov/c/github/eBardX/XestiNotify/master.svg?colorB=4BC51D)](https://codecov.io/github/eBardX/XestiNotify)
[![Documented](https://img.shields.io/cocoapods/metrics/doc-percent/XestiNotify.svg?colorB=4BC51D)](http://ebardx.github.io/XestiNotify/)

[![CocoaPods](https://img.shields.io/cocoapods/v/XestiNotify.svg?colorB=4BC51D)](http://cocoapods.org/pods/XestiNotify)
[![Carthage](https://img.shields.io/badge/carthage-compatible-brightgreen.svg)](https://github.com/Carthage/Carthage)
[![Swift Package Manager](https://img.shields.io/badge/spm-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

* [Overview](#overview)
* [Reference Documentation](#reference-documentation)
* [Requirements](#requirements)
* [Installation](#installation)
    * [CocoaPods](#cocoapods)
    * [Carthage](#carthage)
    * [Swift Package Manager](#swift-package-manager)
* [Usage](#usage)
* [Credits](#credits)
* [License](#license)

## Overview

The XestiNotify framework provides ...

## Reference Documentation

Full [reference documentation][refdoc] is available courtesy of [Jazzy][jazzy].

## Requirements

* iOS 8.0+ / macOS 10.10+ / tvOS 9.0+ / watchOS 2.0+
* Xcode 9.0+
* Swift 4.0+

## Installation

### CocoaPods

[CocoaPods][cocoapods] is a dependency manager for Cocoa projects. You can
install it with the following command:

```
$ gem install cocoapods
```

To integrate XestiNotify into your Xcode project using CocoaPods, specify it in
your `Podfile`:

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'XestiNotify'
end
```

Then, run the following command:

```
$ pod install
```

### Carthage

[Carthage][carthage] is a decentralized dependency manager that builds your
dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew][homebrew] using the following commands:

```
$ brew update
$ brew install carthage
```

To integrate XestiNotify into your Xcode project using Carthage, specify it
in your `Cartfile`:

```
github "eBardX/XestiNotify"
```

Then, run the following command:

```
$ carthage update
```

Finally, drag the built `XestiNotify.framework` into your Xcode project.

### Swift Package Manager

The [Swift Package Manager][spm] (SPM) is a tool for automating the
distribution of Swift code and is integrated into the swift compiler. It does
not yet support all platforms, but you _can_ install XestiNotify on
platforms that SPM _does_ support.

Once you have your Swift package set up, adding XestiNotify as a dependency is
as easy as adding it to the `dependencies` value of your `Package.swift`.

```
dependencies: [
    .package(url: "https://github.com/eBardX/XestiNotify.git", from: "0.1.0")
]
```

## <a name="usage">Usage</a>

## Credits

J. G. Pusey (ebardx@gmail.com)

## License

XestiNotify is available under [the MIT license][license].

[carthage]:     https://github.com/Carthage/Carthage
[cocoapods]:    http://cocoapods.org
[homebrew]:     http://brew.sh/
[jazzy]:        https://github.com/realm/jazzy
[license]:      https://github.com/eBardX/XestiNotify/blob/master/LICENSE.md
[refdoc]:       https://eBardX.github.io/XestiNotify/
[spm]:          https://swift.org/package-manager/
