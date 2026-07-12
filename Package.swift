// swift-tools-version: 6.3.3

import PackageDescription

let package = Package(
    name: "swift-email",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .tvOS(.v17),
        .watchOS(.v10)
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
        .package(url: "https://github.com/swift-foundations/swift-html.git", branch: "main"),
        .package(url: "https://github.com/swift-foundations/swift-dependencies.git", branch: "main"),
        .package(url: "https://github.com/swiftlang/swift-markdown", from: "0.4.0"),
        .package(url: "https://github.com/apple/swift-collections", from: "1.1.2"),
        .package(url: "https://github.com/swift-foundations/swift-translating.git", branch: "main")
    ],
    targets: [
        .target(
            name: "Email",
            dependencies: [
                .product(name: "Email Standard", package: "swift-email-standard"),
                .product(name: "RFC 5322", package: "swift-rfc-5322"),
                .product(name: "HTML", package: "swift-html"),
                .product(name: "HTMLTheme", package: "swift-html"),
                .product(name: "HTMLComponents", package: "swift-html"),
                .product(name: "HTMLMarkdown", package: "swift-html"),
                .product(name: "Dependencies", package: "swift-dependencies"),
                .product(name: "Markdown", package: "swift-markdown"),
                .product(name: "OrderedCollections", package: "swift-collections"),
                .product(
                    name: "Translating",
                    package: "swift-translating",
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
