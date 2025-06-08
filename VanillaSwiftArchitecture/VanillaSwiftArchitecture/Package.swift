// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import CompilerPluginSupport
import PackageDescription

let package = Package(
    name: "VanillaSwiftArchitecture",
    platforms: [
        .iOS(.v18),
        .macOS(.v13),
    ],
    products: [
        .library(name: "MyAppKit", targets: ["MyAppKit"]),
        .library(name: "Store", targets: ["Store"]),
        .library(name: "ParentFeature", targets: ["ParentFeature"]),
        .library(name: "ChildFeature", targets: ["ChildFeature"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-syntax.git", exact: "601.0.1"),
    ],
    targets: [
        .target(
            name: "MyAppKit",
            dependencies: [
                "ParentFeature",
            ]
        ),
        .target(
            name: "Store",
            dependencies: [
                "AppMacros",
            ]
        ),
        .target(
            name: "ParentFeature",
            dependencies: [
                "Store",
                "ChildFeature",
            ]
        ),
        .target(
            name: "ChildFeature",
            dependencies: [
                "Store",
            ]
        ),
        .macro(
            name: "AppMacros",
            dependencies: [
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
            ]
        ),
    ]
)
