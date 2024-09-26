import Foundation

do {
    let options = try ArgumentOptions.parse(CommandLine.arguments)
    try Build.performCommand(options)

    try BuildDovi().buildALL()
} catch {
    print(error.localizedDescription)
    exit(1)
}


enum Library: String, CaseIterable {
    case libdovi
    var version: String {
        switch self {
        case .libdovi:
            return "libdovi-3.3.1"
        }
    }

    var url: String {
        switch self {
        case .libdovi:
            return "https://github.com/quietvoid/dovi_tool"
        }
    }

    // for generate Package.swift
    var targets : [PackageTarget] {
        switch self {
        case .libdovi:
            return  [
                .target(
                    name: "Libdovi",
                    url: "https://github.com/mpvkit/libdovi-build/releases/download/\(BaseBuild.options.releaseVersion)/Libdovi.xcframework.zip",
                    checksum: "https://github.com/mpvkit/libdovi-build/releases/download/\(BaseBuild.options.releaseVersion)/Libdovi.xcframework.checksum.txt"
                ),
            ]
        }
    }
}

private class BuildDovi: BaseBuild {
    init() {
        super.init(library: .libdovi)
    }

    override func environment(platform: PlatformType, arch: ArchType) -> [String: String] {
        var env = super.environment(platform: platform, arch: arch)
        if let hostPath = ProcessInfo.processInfo.environment["PATH"] {
            env["PATH"] = hostPath + ":" + (env["PATH"] ?? "")
        }
        if let envHome = ProcessInfo.processInfo.environment["HOME"] {
            env["PATH"] = "\(envHome)/.cargo/bin:" + (env["PATH"] ?? "")
        }
        return env
    }

    override func build(platform: PlatformType, arch: ArchType) throws {
        var target = platform.rustTarget(arch: arch)
        if target == "x86_64-apple-ios-sim" {
            target = "x86_64-apple-ios"
        }
        if target == "x86_64-apple-tvos-sim" {
            target = "x86_64-apple-tvos"
        }

        let prefix = thinDir(platform: platform, arch: arch)
        let currentDirectoryURL = directoryURL + "dolby_vision"
        let environ = environment(platform: platform, arch: arch)

        let cargo = Utility.shell("which cargo", isOutput: true, environment: environ)!
        try Utility.launch(path: cargo, arguments: ["+stage2", "cinstall", "-Zbuild-std=std,panic_abort", "--release", "--prefix=\(prefix.path)", "--target=\(target)"] , currentDirectoryURL: currentDirectoryURL, environment: environ)
    }
}

extension PlatformType {
    func rustTarget(arch: ArchType) -> String {
        switch self {
        case .ios:
            return "\(arch.cpuFamily)-apple-ios"
        case .isimulator:
            return "\(arch.cpuFamily)-apple-ios-sim"
        case .tvos:
            return "\(arch == .arm64e ? "arm64e" : "\(arch.cpuFamily)")-apple-tvos"
        case .tvsimulator:
            return "\(arch.cpuFamily)-apple-tvos-sim"
        case .xros:
            return "\(arch.cpuFamily)-apple-visionos"
        case .xrsimulator:
            return "\(arch.cpuFamily)-apple-visionos-sim"
        case .macos:
            return "\(arch.cpuFamily)-apple-darwin"
        case .maccatalyst:
            return "\(arch.cpuFamily)-apple-ios-macabi"
        }
    }
}
