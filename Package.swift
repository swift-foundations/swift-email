// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-email",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Email",
            targets: ["Email"]
        )
    ],
    traits: [
        .trait(
            name: "Translating",
            description: "Include TranslatedString integration for internationalization support"
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swift-standards/swift-email-standard", branch: "main"),
        .package(url: "https://github.com/swift-ietf/swift-rfc-5322.git", branch: "main"),
        .package(url: "https://github.com/swift-compositions/swift-html.git", branch: "main"),
        .package(url: "https://github.com/swift-compositions/swift-dependencies.git", branch: "main"),
        // PARKED with EmailMarkdown.swift (coenttb-ectomy 2026-07-12) — sole consumer:
        // .package(url: "https://github.com/swiftlang/swift-markdown", from: "0.4.0"),
        .package(url: "https://github.com/apple/swift-collections", from: "1.1.2"),
        .package(url: "https://github.com/swift-compositions/swift-translating.git", branch: "main"),
        .package(url: "https://github.com/swift-compositions/swift-translating-dependencies.git", branch: "main")
    ],
    targets: [
        .target(
            name: "Email",
            dependencies: [
                .product(name: "Email Standard", package: "swift-email-standard"),
                .product(name: "RFC 5322", package: "swift-rfc-5322"),
                .product(name: "HTML", package: "swift-html"),
                // HANDED OVER (E-1 R-3, 2026-07-13): the parked pf-html-era surface
                // (EmailDocument/EmailMarkdown/BaseStyles/Email+HTML + tests) now lives in
                // swift-email-html — live AppleMail .eml surface plus a Parked/ staging of
                // the pf-era files; their restore stays gated on the OPEN HTML-email story
                // (see swift-email-html Parked/Email/README.md).
                .product(name: "Dependencies", package: "swift-dependencies"),
                .product(name: "OrderedCollections", package: "swift-collections"),
                .product(
                    name: "Translating",
                    package: "swift-translating",
                    condition: .when(traits: ["Translating"])
                ),
                .product(
                    name: "Translating Dependencies",
                    package: "swift-translating-dependencies",
                    condition: .when(traits: ["Translating"])
                )
            ],
            swiftSettings: [
                .define("TRANSLATING", .when(traits: ["Translating"]))
            ]
        ),
        .testTarget(
            name: "Email Tests",
            dependencies: ["Email"]
        )
    ],
    swiftLanguageModes: [.v6]
)
