//
//  ModulePaths.swift
//  ProjectDescriptionHelpers
//
//  Created by LEE on 3/24/24.
//

import Foundation

public enum ModulePaths {
    case App
    case Features(Feature)
    case Service
    case ThirdPartyLib
    case Core
    case Data
    case Domain
    case Infrastructure
    case Resources
}





public extension ModulePaths {
    enum Feature:String, MicroTargetPathConvertable {
        case ReadFeature
        case EditReature
    }
}




public enum MicroTargetType: String {
    case interface = "Interface"
    case sources = ""
    case testing = "Testing"
    case unitTest = "Tests"
    case demo = "Demo"
}

public protocol MicroTargetPathConvertable {
    func targetName(type: MicroTargetType) -> String
}

public extension MicroTargetPathConvertable where Self: RawRepresentable {
    func targetName(type: MicroTargetType) -> String {
        "\(self.rawValue)\(type.rawValue)"
    }
}
