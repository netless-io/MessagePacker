// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "NTLMessagePacker",
    platforms: [
        .macOS(.v13), .iOS(.v12), .tvOS(.v16), .watchOS(.v9)
    ],
    products: [
        .library(name: "NTLMessagePacker", targets: ["NTLMessagePacker"]),
    ],
    targets: [
        .target(name: "NTLMessagePacker", dependencies: [], path: "Sources"),
        .testTarget(name: "NTLMessagePackerTests", dependencies: ["NTLMessagePacker"]),
    ],
    swiftLanguageVersions: [.v5]
)
