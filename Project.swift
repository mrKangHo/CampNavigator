import ProjectDescription

let project = Project(
    name: "CampNavigator",
    targets: [
        .target(
            name: "CampNavigator",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.CampNavigator",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["CampNavigator/Sources/**"],
            resources: ["CampNavigator/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "CampNavigatorTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.CampNavigatorTests",
            infoPlist: .default,
            sources: ["CampNavigator/Tests/**"],
            resources: [],
            dependencies: [.target(name: "CampNavigator")]
        ),
    ]
)
