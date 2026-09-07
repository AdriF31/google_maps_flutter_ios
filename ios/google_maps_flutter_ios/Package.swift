// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "google_maps_flutter_ios",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(
            name: "google-maps-flutter-ios",
            targets: ["google_maps_flutter_ios"]
        )
    ],
    dependencies: [
        // Keep in sync with ios/google_maps_flutter_ios.podspec:
        // GoogleMaps >= 8.4 < 11.0, Google-Maps-iOS-Utils >= 5.0 < 7.0
        // google_maps_flutter_ios supports iOS 14+ via CocoaPods; the SPM
        // path requires iOS 15 because GoogleMapsUtils 6.1.0 is the last
        // release supporting GoogleMaps 9.x / iOS 15.
        .package(
            url: "https://github.com/googlemaps/ios-maps-sdk",
            "9.0.0"..<"10.0.0"
        ),
        .package(
            url: "https://github.com/googlemaps/google-maps-ios-utils",
            "6.1.0"..<"6.1.1"
        )
    ],
    targets: [
        .target(
            name: "google_maps_flutter_ios",
            dependencies: [
                .product(name: "GoogleMaps", package: "ios-maps-sdk"),
                .product(name: "GoogleMapsUtils", package: "google-maps-ios-utils")
            ],
            resources: [
                .process("Resources")
            ],
            cSettings: [
                .headerSearchPath("include/google_maps_flutter_ios"),
                // Signals GoogleMapsUtilsTrampoline.h to import the ObjC
                // module (GoogleMapsUtilsObjC) instead of the CocoaPods
                // umbrella module (GoogleMapsUtils).
                .define("GOOGLE_MAPS_FLUTTER_SPM")
            ]
        )
    ]
)
