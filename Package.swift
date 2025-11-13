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
            url: "https://github.com/mpvkit/libdovi-build/releases/download/3.3.1-xcode/Libdovi.xcframework.zip",
            checksum: "20021f2644da6986ae4ee456d8f917774f7c1324532843ff795ac3034ee7c88e"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
