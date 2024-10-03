import ProjectDescription

 
public extension Project {
    
    static func makeModule(_ module: ModuleProtocol
    ) -> Project {
        
        let settings: Settings = .settings(
            base: [:],
            configurations: [
                .debug(name: .debug),
                .release(name: .release)
            ], defaultSettings: .recommended)

        let appTarget = Target.target(
            name: module.name,
            destinations: .iOS,
            product: module.product,
            bundleId: "\(ENV.prefixBundleId).\(module.name)",
            deploymentTargets: ENV.deploymentTarget,
            infoPlist: module.infoPlist,
            sources: module.sources,
            resources: module.resources,
            dependencies: module.dependencies
        )

        
        let isFeatures = module is Modules.Feature
        
        

        let schemes: [Scheme] = [.makeScheme(target: .debug, name: module.name)]

        var targets: [Target] = [appTarget]
  
        
        if isFeatures {
            let appPreviewTarget = Target.target(
                name: "\(module.name)Preview",
                destinations: .iOS,
                product: .app,
                bundleId: "\(ENV.prefixBundleId).\(module.name)Preview",
                deploymentTargets: ENV.deploymentTarget,
                infoPlist: module.infoPlist,
                sources: module.sources,
                resources: module.resources,
                dependencies: [.target(name: module.name)]
            )
            
            targets.append(appPreviewTarget)
        }
        
        
        if module.includeTesting {
            let testTarget = Target.target(name: "\(module.name)Tests",
                                           destinations: .iOS,
                                           product: .unitTests,
                                           bundleId: "\(ENV.prefixBundleId).\(module.name)Tests",
                                           deploymentTargets: ENV.deploymentTarget,
                                           infoPlist:module.infoPlist,
                                           sources:["Tests/**"],
                                           dependencies: [.target(name: module.name)])
            targets.append(testTarget)
            
        }
        
        
  

        return Project(
            name: module.name,
            organizationName: ENV.organizationName,
            packages: [],
            settings: settings,
            targets: targets,
            schemes: schemes,
            resourceSynthesizers: module.resourceSynthesizers
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
