// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WeatherSearch",
    platforms: [
      .iOS(.v16),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "WeatherSearch",
            targets: ["WeatherSearch"]),
        .library(
            name: "WeatherSearchMocks",
            targets: ["WeatherSearchMocks"]),
    ],
    dependencies: [
        .package(path: "../NetworkService"),
        .package(path: "../DesignComponents"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "WeatherSearch",
            dependencies: ["NetworkService", "DesignComponents"]),
        .target(
            name: "WeatherSearchMocks",
            dependencies: [
                .target(name: "WeatherSearch")
            ]),
        .testTarget(
            name: "WeatherSearchTests",
            dependencies: [
                .target(name: "WeatherSearch"),
                .target(name: "WeatherSearchMocks"),
                .product(name: "NetworkServiceMocks", package: "NetworkService"),
            ]),
    ]
)
