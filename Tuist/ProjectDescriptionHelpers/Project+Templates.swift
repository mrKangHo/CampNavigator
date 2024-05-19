import ProjectDescription

 
public extension Project {
    
 
    static func makeTestModule(module: Module, 
                               deploymentTarget: DeploymentTargets? = .iOS("15.0"),
                               infoPlist: InfoPlist? = nil) -> Target? {
        let testTarget = Target.target(name: "\(module.name)Tests",
                                       destinations: [.iPhone, .iPad],
                                       product: .unitTests,
                                       bundleId: "coke.camp.\(module.name)Tests",
                                       deploymentTargets: deploymentTarget,
                                       infoPlist:infoPlist,
                                       sources:["Tests/**"],
                                       dependencies: [.target(name: module.name)])
        return testTarget
    }
    
    static func makeModule(
        module: Module,
        product: Product,
        organizationName: String = "COKE",
        packages: [Package] = [],
        deploymentTarget: DeploymentTargets? = .iOS("15.0"),
        dependencies: [TargetDependency] = [],
        sources: SourceFilesList = ["Sources/**"],
        resources: ResourceFileElements? = nil,
        infoPlist: InfoPlist? = nil,
        addinalTarget:[Target]? = nil
    ) -> Project {
        let settings: Settings = .settings(
            base: [:],
            configurations: [
                .debug(name: .debug),
                .release(name: .release)
            ], defaultSettings: .recommended)

        let appTarget = Target.target(
            name: module.name,
            destinations: [.iPhone, .iPad],
            product: product,
            bundleId: "coke.camp",
            deploymentTargets: deploymentTarget,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            dependencies: dependencies
        )

        

        let schemes: [Scheme] = [.makeScheme(target: .debug, name: module.name)]

        var targets: [Target] = [appTarget]
        
 
        
        addinalTarget?.forEach({ addTarget in
            targets.append(addTarget)
        })

        return Project(
            name: module.name,
            organizationName: organizationName,
            packages: packages,
            settings: settings,
            targets: targets,
            schemes: schemes
        )
    }
    
    
    static func makeSubFeature(
        featureName: String,
        destinations: Destinations = [.iPhone, .iPad],
        product: Product,
        organizationName: String = "COKE",
        packages: [Package] = [],
        deploymentTarget: DeploymentTargets? = .iOS("15.0"),
        dependencies: [TargetDependency] = [],
        sources: SourceFilesList = ["Sources/**"],
        resources: ResourceFileElements? = nil,
        infoPlist: InfoPlist? = nil,
        addinalTarget:[Target]? = nil
    ) -> Project {
        let settings: Settings = .settings(
            base: [:],
            configurations: [
                .debug(name: .debug),
                .release(name: .release)
            ], defaultSettings: .recommended)

        let appTarget = Target.target(
            name: featureName,
            destinations: destinations,
            product: product,
            bundleId: "coke.camp",
            deploymentTargets: deploymentTarget,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            dependencies: dependencies
        )

        let testTarget = Target.target(name: "\(featureName)Tests",
                                       destinations: destinations,
                                       product: .unitTests,
                                       bundleId: "coke.camp.\(featureName)Tests",
                                       deploymentTargets: deploymentTarget,
                                       infoPlist:infoPlist,
                                       sources:["Tests/**"],
                                       dependencies: [.target(name: featureName)])
        
        

        let schemes: [Scheme] = [.makeScheme(target: .debug, name: featureName)]

        var targets: [Target] = [appTarget, testTarget]
        
        addinalTarget?.forEach({ addTarget in
            targets.append(addTarget)
        })

        return Project(
            name: featureName,
            organizationName: organizationName,
            packages: packages,
            settings: settings,
            targets: targets,
            schemes: schemes
        )
    }
    
    
    
    
}

extension Scheme {
    static func makeScheme(target: ConfigurationName, name: String) -> Scheme {
        
        return Scheme.scheme(name: name, 
                             shared: true,
                             hidden: false,
                             buildAction: .buildAction(targets: ["\(name)"]),
                             testAction: .targets(
                                ["\(name)Tests"],
                                configuration: target,
                                options: .options(coverage: true, codeCoverageTargets: ["\(name)"])
                             ),
                             runAction: .runAction(configuration: target),
                             archiveAction: .archiveAction(configuration: target),
                             profileAction: .profileAction(configuration: target),
                             analyzeAction: .analyzeAction(configuration: target))
    }
}
