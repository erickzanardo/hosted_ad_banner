# Hosted Ad Banner

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]
[![shorebird ci](https://api.shorebird.dev/api/v1/github/erickzanardo/hosted_ad_banner/badge.svg)](https://console.shorebird.dev/ci)

A Flutter package that implements ad banner widget for self hosted ads

## Installation 💻

**❗ In order to start using Hosted Ad Banner you must have the [Flutter SDK][flutter_install_link] installed on your machine.**

Install via `flutter pub add`:

```sh
dart pub add hosted_ad_banner
```

## Motivation

To add ads to a mobile application, your application needs to be published in the store so AdMob can verify your app
and review it.

This means that during a time, your app will not be able to show ads.

Releasing an app that is marketed as "contains ad" but not having any for a moment, and then adding them afterwards
might lead to a confusing and weird experience to users.

To address that, this package provides a widget that can show ads from a self hosted source, which can be used while
that review process is under way.

Additionally, this package can be used as simple solution for apps that want to show ads about their own content, services
or products.

## How to use

```dart
HostedAdBanner(
  hostedAdds: const [
    HostedAdd(
      targetUrl: 'http://g4me.info/mine',
      imageUrls: [
        'https://cherrybitstudio.wordpress.com/wp-content/uploads/2025/10/mco-2.png',
      ],
    ),
    HostedAdd(
      targetUrl: 'http://g4me.info/doug',
      imageUrls: [
        'https://cherrybitstudio.wordpress.com/wp-content/uploads/2025/10/gd-1.png',
      ],
    ),
  ],
  width: MediaQuery.sizeOf(context).width,
  height: 100,
),
```

---

[flutter_install_link]: https://docs.flutter.dev/get-started/install
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
