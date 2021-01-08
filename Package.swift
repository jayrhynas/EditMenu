// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "EditMenu",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "EditMenu",
            targets: ["EditMenu"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "EditMenu",
            dependencies: []),
        .testTarget(
            name: "EditMenuTests",
            dependencies: ["EditMenu"]),
    ]
)
