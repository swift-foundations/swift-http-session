// swift-tools-version: 6.3.3

import PackageDescription

let package = Package(
    name: "swift-http-session",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26),
    ],
    products: [
        .library(
            name: "HTTP Session",
            targets: ["HTTP Session"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swift-foundations/swift-http-cookies.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "HTTP Session",
            dependencies: [
                .product(name: "HTTP Cookies", package: "swift-http-cookies"),
            ]
        ),
        .testTarget(
            name: "HTTP Session Tests",
            dependencies: ["HTTP Session"]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    target.swiftSettings =
        (target.swiftSettings ?? []) + [
            .strictMemorySafety(),
            .enableUpcomingFeature("ExistentialAny"),
            .enableUpcomingFeature("InternalImportsByDefault"),
            .enableUpcomingFeature("MemberImportVisibility"),
            .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
            .enableExperimentalFeature("LifetimeDependence"),
            .enableExperimentalFeature("Lifetimes"),
            .enableExperimentalFeature("SuppressedAssociatedTypes"),
            .enableUpcomingFeature("InferIsolatedConformances"),
        ]
}
