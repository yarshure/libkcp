// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "KCP",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
    ],
    products: [
        .library(name: "KCP", targets: ["KCP"]),
    ],
    targets: [
        .target(
            name: "libkcp",
            path: "Sources/libkcp",
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include"),
                .headerSearchPath("."),
            ],
            cxxSettings: [
                .headerSearchPath("include"),
                .headerSearchPath("."),
            ]
        ),
        .target(
            name: "KCP",
            dependencies: ["libkcp"],
            path: "Sources/KCP"
        ),
        .testTarget(
            name: "libkcpTests",
            dependencies: ["KCP", "libkcp"],
            path: "Tests/libkcpTests"
        ),
    ]
)
