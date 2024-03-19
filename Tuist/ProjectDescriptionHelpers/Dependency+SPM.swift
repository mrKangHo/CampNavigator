//
//  Dependency+SPM.swift
//  ProjectDescriptionHelpers
//
//  Created by LEE on 2023/07/03.
//

import ProjectDescription

public extension TargetDependency {
    enum SPM {}
}

public extension TargetDependency.SPM {
    static let Alamofire = TargetDependency.external(name: "Alamofire")
    static let TCA = TargetDependency.external(name: "ComposableArchitecture")
}
