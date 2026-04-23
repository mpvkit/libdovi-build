// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "build",
    platforms: [.macOS(.v11)],
    products: [
        .executable(name: "build", targets: ["build"])
    ],
    dependencies: [
        .package(url: "https://github.com/mpvkit/BuildShared.git", revision: "a8f5d9977128f0ec66d3f8d6ec5dbd42598aa67c")
    ],
    targets: [
        .executableTarget(
            name: "build",
            dependencies: ["BuildShared"],
            path: "XCFrameworkBuild",
            sources: ["main.swift"]
        )
    ]
)
