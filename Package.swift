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
            url: "https://github.com/mpvkit/libdovi-build/releases/download/3.3.1/Libdovi.xcframework.zip",
            checksum: "9148dc1a7fc33ac16a4ea2a472e53a51aaf2d6955b2bc975d9321c2f6a4eff8e"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
