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
            url: "https://github.com/mpvkit/libdovi-build/releases/download/3.3.1-xcode26/Libdovi.xcframework.zip",
            checksum: "8c2816cff25cc5e4b0330d4017b27375784b4096ca05aeaad8e7f513dbef9c18"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
