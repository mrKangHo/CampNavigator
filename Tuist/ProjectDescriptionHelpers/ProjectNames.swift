//
//  ProjectNames.swift
//  ProjectDescriptionHelpers
//
//  Created by LEE on 2023/07/04.
//

import ProjectDescription


public enum Module {
    case App
    case Feature
    case Service
    case ThirdPartyLib
    case Core
    case Data
    case Domain
    case Infrastructure
    case Resources
}


extension Module {
    public var name: String {
        switch self {
        case .App:
            return "App"
        case .Feature:
            return "Feature"
        case .Service:
            return "Service"
        case .ThirdPartyLib:
            return "ThirdPartyLib"
        case .Core:
            return "Core"
        case .Data:
            return "Data"
        case .Domain:
            return "Domain"
        case .Infrastructure:
            return "Infrastructure"
        case .Resources:
            return "Resources"
        }
    }
    
    public var path:ProjectDescription.Path {
        return .relativeToRoot("App/" + self.name)
    }
    
    public var project: TargetDependency {
        return .project(target: self.name,
                        path: self.path)
    }
}

extension Module: CaseIterable {}
