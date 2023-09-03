// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CurrentWeather",
    platforms: [
      .iOS(.v16),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CurrentWeather",
            targets: ["CurrentWeather"]),
        .library(
            name: "CurrentWeatherMocks",
            targets: ["CurrentWeatherMocks"]),
    ],
    dependencies: [
        .package(path: "../Utilities"),
        .package(path: "../NetworkService"),
        .package(path: "../DesignComponents"),
        .package(path: "../WeatherSearch"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CurrentWeather",
            dependencies: ["Utilities", "NetworkService", "DesignComponents", "WeatherSearch"]),
        .target(
            name: "CurrentWeatherMocks",
            dependencies: [
                .target(name: "CurrentWeather")
            ]),
        .testTarget(
            name: "CurrentWeatherTests",
            dependencies: [
                .target(name: "CurrentWeatherMocks"),
                .product(name: "WeatherSearchMocks", package: "WeatherSearch"),
                .product(name: "NetworkServiceMocks", package: "NetworkService"),
                .product(name: "UtilitiesMocks", package: "Utilities"),
            ]),
    ]
)
