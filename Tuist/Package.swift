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
        .package(url: "https://github.com/Alamofire/Alamofire", exact: "5.6.0"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", exact: "1.9.2")
        
    ]
)
