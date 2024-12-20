// swift-tools-version: 5.9
import PackageDescription

#if TUIST
import ProjectDescription
import ProjectDescriptionHelpers

let packageSettings = PackageSettings(
    baseSettings: .settings(configurations: [.debug(name: .debug),
        .release(name: .release)])
)

#endif

let package = Package(
    name: "PackageName",
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", exact: "1.9.2"),
        .package(url: "https://github.com/mrKangHo/KHDesignSystem.git", branch: "main"),
        .package(url: "https://github.com/airbnb/lottie-ios.git", exact: "4.4.3")
        
    ]
)
