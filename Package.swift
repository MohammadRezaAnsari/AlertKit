// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AlertKit",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "AlertKit",
            targets: ["AlertKit"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftKickMobile/SwiftMessages.git", from: "9.0.4"),
        .package(url: "https://github.com/MohammadRezaAnsari/ExtensionKit.git", from: "1.6.0"),
    ],
    targets: [
        .target(
            name: "AlertKit",
            dependencies: [
                "SwiftMessages",
                "ExtensionKit"
            ]
        )
    ]
)
