//
//  Project+Features.swift
//  Manifests
//
//  Created by LEE on 10/3/24.
//

import ProjectDescription

public extension Modules {
    enum Feature:CaseIterable {
        case Intro
        case Read
        case Edit
        case Filter
        case Facilities
    }
}

extension Modules.Feature : ModuleProtocol {
    
    
    public var name: String {
        switch self {
            
        case .Intro:
            return "Intro"
        case .Read:
            return "Read"
        case .Edit:
            return "Edit"
        case .Filter:
            return "Filter"
        case .Facilities:
            return "Facilities"
        }
    }
    
    public var includeTesting: Bool {
        return true
    }
    
    public var product: Product {
        switch self {
        case .Intro:
            return .framework
        case .Read:
            return .framework
        case .Edit:
            return .framework
        case .Filter:
            return .staticLibrary
        case .Facilities:
            return .framework
        }
    }
    
    public var infoPlist: InfoPlist {
        switch self {
        case .Intro:
            return .default
        case .Read:
            return .default
        case .Edit:
            return .default
        case .Filter:
            return .default
        case .Facilities:
            return .default
        }
    }

    public var sources: SourceFilesList? {
        return ["Sources/**"]
    }
    
    public var resources: ResourceFileElements? {
        return ["Resources/**"]
    }
    
    public var dependencies: [TargetDependency] {
        switch self {
            
        case .Intro:
            [.Projcet.Data,
             .Projcet.Domain,
             .Projcet.Resources,
             .Projcet.ThirdPartyLib,
             .Features.Read]
        case .Read:
            [.Projcet.Data,
             .Projcet.Domain,
             .Projcet.Resources,
             .Projcet.ThirdPartyLib,
             .Features.Edit]
        case .Edit:
            [.Projcet.Data,
             .Projcet.Domain,
             .Projcet.Resources,
             .Projcet.ThirdPartyLib,
             .Features.Filter,
             .Features.Facilities]
        case .Filter:
            [.Projcet.Data,
             .Projcet.Domain,
             .Projcet.Resources,
             .Projcet.ThirdPartyLib,]
        case .Facilities:
            [.Projcet.Data,
             .Projcet.Domain,
             .Projcet.Resources,
             .Projcet.ThirdPartyLib,]
        }
    }
    
    public var resourceSynthesizers: [ResourceSynthesizer] {
        return .default
    }

}

