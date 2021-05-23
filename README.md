
# Cellable

![Swift](https://img.shields.io/badge/Swift-4.2-orange.svg)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](https://github.com/nibdevn/Cellable/blob/master/LICENSE)

## Summary

- [Requirements](#requirements)
- [Installation](#installation)
- [Template](#template)
- [Property](#property)
- [Example](#example)

## Requirements

- Swift 4.2
- iOS 10.0+

## Installation

#### Cocoapods

Cellable is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Cellable', :tag => '3.0.0', :git => 'https://github.com/nibdevn/Cellable'
```

#### Swift Package Manager

You can use The Swift Package Manager to install Cellable by adding the proper description to your Package.swift file:

```swift
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    targets: [],
    dependencies: [
        .package(url: "https://github.com/nibdevn/Cellable.git", from: "3.0.0")
    ]
)
```

Next, add Cellable to your targets dependencies like so:

```swift
.target(
    name: "YOUR_TARGET_NAME",
    dependencies: [
        "Cellable",
    ]
),
```

Then run swift package update.

## Template

If you are trying to create a View that implemented Cellable
Recommend For you using this [Template](<https://github.com/nibdevn/Cellable-Template>)

## Property

#### bundle
> This property is used as a parameter when generating UINib. 
> The default implementation is nil. 
> If you need a specific bundle, please implement it.

```swift
static var bundle: Bundle? { get }
```

#### forNibNameIdentifier
> This property is used as a parameter when generating UINib.
> The default implementation is className.
> If you need a specific for Nib NameIdentifier, please implement it.

```swift
static var forNibNameIdentifier: String { get }
```

#### forCellReuseIdentifier
> This property is the identifier of the cell you want to reuse in Collection View or Table View. 
> The default implementation is className. 
> If you need a specific for Nib NameIdentifier, please implement it.

```swift
static var forCellReuseIdentifier: String { get }
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## License

These works are available under the MIT license. See the [LICENSE][license] file
for more info.


[license]: LICENSE
