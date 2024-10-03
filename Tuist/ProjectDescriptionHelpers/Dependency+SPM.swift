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
    static let TCA = TargetDependency.external(name: "ComposableArchitecture")
    static let KHDesignSystem = TargetDependency.external(name: "KHDesignSystem")
    static let Lottie = TargetDependency.external(name: "Lottie")
    static let Dependencies = TargetDependency.external(name: "Dependencies")
}
