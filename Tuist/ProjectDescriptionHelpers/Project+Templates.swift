import ProjectDescription

public extension Project {
    
    static func app() -> Project {
        
        return self.makeModule(
            module: .App,
            platform: .iOS,
            product: .app,
            dependencies: [
                .Projcet.Feature
            ],
            resources: ["Resources/**"],
            infoPlist: .extendingDefault(with: [
                "UIMainStoryboardFile": "",
                "UILaunchStoryboardName": "Launch Screen",
                "ENABLE_TESTS": .boolean(true),
            ]))
    }
    
    static func feature() -> Project {
        return self.makeModule(
            module:.Feature,
            product: .staticFramework,
            dependencies: [
                .Projcet.Core,
                .Projcet.Data,
                .Projcet.Domain,
                .Projcet.Resources,
                .Projcet.ThirdPartyLib
            ],
            resources: ["Resources/**"]
        )
    }
    
    
    
    static func core() -> Project {
        return self.makeModule(
            module:.Core,
            product: .staticFramework,
            dependencies: [
                .Projcet.Resources
            ],
            resources: ["Resources/**"]
        )
    }
    
    static func data() -> Project {
        return self.makeModule(
            module:.Data,
            product: .staticFramework,
            dependencies: [
                .Projcet.Core,
                .Projcet.Infrastructure,
                .Projcet.Domain
            ],
            resources: ["Resources/**"]
        )
    }
    
    static func domain() -> Project {
        return self.makeModule(
            module:.Domain,
            product: .staticFramework,
            dependencies: [
                .Projcet.Core
            ],
            resources: ["Resources/**"]
        )
    }
    
    static func infrastructure() -> Project {
        return self.makeModule(
            module:.Infrastructure,
            product: .staticFramework,
            dependencies: [
//                .Projcet.Service
            ],
            resources: ["Resources/**"]
        )
    }
    
    static func resources() -> Project {
        return self.makeModule(
            module:.Resources,
            product: .staticFramework,
            dependencies: [
//                .Projcet.Service
            ],
            resources: ["Resources/**"]
        )
    }
    
    
    static func thirdPartyLib() -> Project {
        
        return self.makeModule(
            module: .ThirdPartyLib,
            product: .staticFramework,
            packages: [],
            dependencies: [ 
                            .SPM.TCA,
                            .SPM.Alamofire
            ]
        )
    }
}
 


public extension Project {
    
 
    
    static func makeModule(
        module: Module,
        platform: Platform = .iOS,
        product: Product,
        organizationName: String = "COKE",
        packages: [Package] = [],
        deploymentTarget: DeploymentTargets? = .iOS("15.0"),
        dependencies: [TargetDependency] = [],
        sources: SourceFilesList = ["Sources/**"],
        resources: ResourceFileElements? = nil,
        infoPlist: InfoPlist = .default,
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

        let testTarget = Target.target(name: "\(module.name)Tests",
                                       destinations: [.iPhone, .iPad],
                                       product: .unitTests,
                                       bundleId: "coke.camp.\(module.name)Tests",
                                       deploymentTargets: deploymentTarget,
                                       infoPlist:infoPlist,
                                       sources:["Tests/**"],
                                       dependencies: [.target(name: module.name)])
        
        

        let schemes: [Scheme] = [.makeScheme(target: .debug, name: module.name)]

        var targets: [Target] = [appTarget, testTarget]
        
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
