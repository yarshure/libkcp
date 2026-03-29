// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "libkcp",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
    ],
    products: [
        .library(name: "KCP", targets: ["KCP"]),
    ],
    targets: [
        .target(
            name: "KCP",
            path: ".",
            exclude: [
                "iOSLib/libkcp/Carthage",
                "iOSLib/libkcp/build",
                "iOSLib/libkcp/KCPiOS",
                "iOSLib/libkcp/KCPMac",
                "iOSLib/libkcp/kcpOSX",
                "iOSLib/libkcp/kcptest",
                "iOSLib/libkcp/TestNew",
                "iOSLib/libkcp/libkcp.xcodeproj",
                "iOSLib/libkcp/libkcp/Info.plist",
                "iOSLib/libkcp/libkcp/kcp.h",   // framework umbrella header
                "kcp_test.cpp",
                "fec_test.cpp",
                "kcpserver.go",
                "CMakeLists.txt",
                "README.md",
                "LICENSE.md",
                "logo.png",
            ],
            sources: [
                // C/C++ core (KCP protocol + FEC/Reed-Solomon)
                "ikcp.c",
                "fec.cpp",
                "galois.cpp",
                "galois_noasm.cpp",
                "galois_table.c",
                "inversion_tree.cpp",
                "matrix.cpp",
                "reedsolomon.cpp",
                "sess.cpp",
                // ObjC/ObjC++ iOS wrapper
                "iOSLib/libkcp/libkcp/BlockCrypt.cpp",
                "iOSLib/libkcp/libkcp/CRC32.cpp",
                "iOSLib/libkcp/libkcp/Crypt.mm",
                "iOSLib/libkcp/libkcp/SFKcpTun.mm",
                "iOSLib/libkcp/libkcp/TunConfig.m",
            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("."),
                .headerSearchPath("iOSLib/libkcp/libkcp"),
                .headerSearchPath("iOSLib/libkcp/KCPMac"),
            ],
            cxxSettings: [
                .headerSearchPath("."),
                .headerSearchPath("iOSLib/libkcp/libkcp"),
                .headerSearchPath("iOSLib/libkcp/KCPMac"),
            ]
        ),
    ]
)
