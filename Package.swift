// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "libdovi",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13)],
    products: [
        .library(name: "Libdovi", targets: ["_Libdovi"]),
    ],
    targets: [
        // Need a dummy target to embedded correctly.
        // https://github.com/apple/swift-package-manager/issues/6069
        .target(
            name: "_Libdovi",
            dependencies: ["Libdovi"],
            path: "Sources/_Dummy"
        ),
        //AUTO_GENERATE_TARGETS_BEGIN//

        .binaryTarget(
            name: "Libdovi",
            url: "https://github.com/mpvkit/libdovi-build/releases/download/3.3.1-test/Libdovi.xcframework.zip",
            checksum: "7a62ec3f36a9219c5c1b16c8549b03152b7b7f0a1997620079ea2449ef4ce8e2"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
