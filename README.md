
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

Cellable is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Cellable', :tag => '2.0.0', :git => 'https://github.com/nibdevn/Cellable'
```

## Template

もし、Xcodeで、Cellableのプロトコルが実装された、Cell(View)を、生成する場合、
Templateを提供致します。
こちらから[Template](<https://github.com/nibdevn/Cellable-Template>)を見れます。

## Property

#### bundle
> このプロパティはUINibを生成する時、パラメーターとして使われます。
> Default実装では、nilになります。
> もし、特定なbundleが必要な場合、実装してください。
```swift
static var bundle: Bundle? { get }
```

#### forNibNameIdentifier
> このプロパティはUINibを生成する時、パラメーターとして使われます。
> Default実装では、classNameになります。
> もし、特定なforNibNameIdentifierが必要な場合、実装してください。

```swift
static var forNibNameIdentifier: String { get }
```

#### forCellReuseIdentifier
> このプロパティはCollectionViewや、TableViewで、再使用するCellのIdentifierとなります。
> Default実装では、classNameになります。
> もし、特定なforNibNameIdentifierが必要な場合、実装してください。
```swift
static var forCellReuseIdentifier: String { get }
```

## Example

Exampleプロジェクトを実行するためには、このレポジトリをクーロンし、Exampleフォルダーから、`pod install`　こちらのコマンドを実行してください。

## License

These works are available under the MIT license. See the [LICENSE][license] file
for more info.


[license]: LICENSE
