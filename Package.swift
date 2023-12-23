// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "libdovi",
    defaultLocalization: "en",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13)],
    products: [
        .library(name: "libdovi", targets: ["Libdovi"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        .executableTarget(
            name: "build",
            path: "Plugins/BuildFFmpeg"
        ),
        .binaryTarget(
            name: "Libdovi",
            path: "Sources/Libdovi.xcframework"
        ),
    ]
)
