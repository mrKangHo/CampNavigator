//
//  Project+Module.swift
//  Manifests
//
//  Created by LEE on 10/3/24.
//
import ProjectDescription

public enum Modules {
    case App
    case ThirdPartyLib
    case Core
    case Data
    case Domain
    case Infrastructure
    case Resources
}

extension Modules : ModuleProtocol {
    
    
    public var name: String {
        switch self {
        case .App: return "CampNavigator"
        case .ThirdPartyLib: return "ThirdPartyLib"
        case .Core: return "Core"
        case .Data: return "Data"
        case .Domain: return "Domain"
        case .Infrastructure: return "Infrastructure"
        case .Resources: return "Resources"
        }
    }
    
    public var includeTesting: Bool {
        return false
    }
    
    public var product: Product {
        switch self {
        case .App: return .app
        case .ThirdPartyLib: return .framework
        case .Core: return .framework
        case .Data: return .framework
        case .Domain: return .framework
        case .Infrastructure: return .framework
        case .Resources: return .framework
        }
    }
    
    public var infoPlist: InfoPlist {
        switch self {
        
        case .App:
            return .extendingDefault(with: ["CFBundleDisplayName":.string(ENV.disPlayName),
                "UIMainStoryboardFile": "",
                "UILaunchStoryboardName": "Launch Screen",
                "ENABLE_TESTS": .boolean(true),
            ])
        case .ThirdPartyLib:
            return .default
        case .Core:
            return .default
        case .Data:
            return .default
        case .Domain:
            return .default
        case .Infrastructure:
            return .default
        case .Resources:
            return .default
        }
    }
    
    public var sources: SourceFilesList? {
        return ["Sources/**"]
    }
    
    public var resources: ResourceFileElements? {
        
        switch self {
        case .App:
            return ["Resources/**"]
        case .ThirdPartyLib:
            return nil
        case .Core:
            return ["Resources/**"]
        case .Data:
            return ["Resources/**"]
        case .Domain:
            return ["Resources/**"]
        case .Infrastructure:
            return ["Resources/**"]
        case .Resources:
            return ["Resources/**"]
        }
    }

    
    public var dependencies: [TargetDependency] {
        switch self {
        case .App:
            [.Features.Intro,
             .Features.Read]
        case .ThirdPartyLib:
            [.SPM.TCA,
             .SPM.Lottie,
             .SPM.KHDesignSystem]
        case .Core:
            []
        case .Data:
            [.Projcet.Infrastructure,
             .SPM.Dependencies]
        case .Domain:
            [.Projcet.Core]
        case .Infrastructure:
            []
        case .Resources:
            [.SPM.Lottie]
        }
    }
    
    public var resourceSynthesizers: [ResourceSynthesizer] {
        switch self {
        case .App:
            return .default
        case .ThirdPartyLib:
            return .default
        case .Core:
            return .default
        case .Data:
            return .default
        case .Domain:
            return .default
        case .Infrastructure:
            return .default
        case .Resources:
            return [.assets(),
                    .custom(name: "Lottie",
                            parser: .json,
                            extensions: ["lottie"])]
        }
    }
}
