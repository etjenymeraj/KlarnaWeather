// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Utilities",
    platforms: [
      .iOS(.v16),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Utilities",
            targets: ["Utilities"]),
        .library(
            name: "UtilitiesMocks",
            targets: ["UtilitiesMocks"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Utilities",
            dependencies: []),
        .target(
            name: "UtilitiesMocks",
            dependencies: [
                .target(name: "Utilities")
            ]),
        .testTarget(
            name: "UtilitiesTests",
            dependencies: [
                .target(name: "Utilities"),
                .target(name: "UtilitiesMocks")
            ]),
    ]
)
