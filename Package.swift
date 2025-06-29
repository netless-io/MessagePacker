// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "MessagePacker",
    platforms: [
        .macOS(.v13), .iOS(.v12), .tvOS(.v16), .watchOS(.v9)
    ],
    products: [
        .library(name: "MessagePacker", targets: ["MessagePacker"]),
    ],
    targets: [
        .target(name: "MessagePacker", dependencies: [], path: "Sources"),
        .testTarget(name: "MessagePackerTests", dependencies: ["MessagePacker"]),
    ],
    swiftLanguageVersions: [.v5]
)
