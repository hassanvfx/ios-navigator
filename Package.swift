// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NavigatorLib",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "NavigatorLib",
            targets: ["NavigatorLib"]
        ),
    ],
    dependencies: [
        .package(name: "Lux", url: "https://github.com/spree3d/lux-1", .exact("1.2.7"))
    ],
    targets: [
        .target(
            name: "NavigatorLib",
            dependencies: ["Lux"]
        ),
        .testTarget(
            name: "NavigatorLibTests",
            dependencies: ["NavigatorLib"]
        ),
    ]
)
