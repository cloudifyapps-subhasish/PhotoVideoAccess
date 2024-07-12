// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "PhotoVideoAccess",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "PhotoVideoAccess",
            targets: ["PhotoVideoAccessPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "PhotoVideoAccessPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/PhotoVideoAccessPlugin"),
        .testTarget(
            name: "PhotoVideoAccessPluginTests",
            dependencies: ["PhotoVideoAccessPlugin"],
            path: "ios/Tests/PhotoVideoAccessPluginTests")
    ]
)