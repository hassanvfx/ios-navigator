// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NavigatorLib",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "NavigatorLib",
            targets: ["NavigatorLib"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/spree3d/ios-coreui", exact: "3.1.0")
    ],
    targets: [
        .target(
            name: "NavigatorLib",
            dependencies: [
                .product(name: "CoreUIKit", package: "ios-coreui")
            ]
        ),
        .testTarget(
            name: "NavigatorLibTests",
            dependencies: ["NavigatorLib"]
        ),
    ]
)
