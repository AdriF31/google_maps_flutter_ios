// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "google_maps_flutter_ios",
    platforms: [
        .iOS("14.0")
    ],
    products: [
        .library(
            name: "google-maps-flutter-ios",
            targets: ["google_maps_flutter_ios"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "google_maps_flutter_ios",
            dependencies: [],
            resources: [
                .process("Resources")
            ],
            cSettings: [
                .headerSearchPath("include/google_maps_flutter_ios")
            ]
        )
    ]
)
