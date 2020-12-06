// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "LogVisualizer",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "LogVisualizer",
            targets: ["LogVisualizer"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.4.0"),
    ],
    targets: [
        .target(
            name: "LogVisualizer",
            dependencies: [
                .product(name: "Logging", package: "swift-log")
            ],
            path: "Sources")
    ]
)
