//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by LEE on 3/12/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.core()

fileprivate extension Project {
    static func core() -> Project {
        return self.makeModule(
            module:.Core,
            product: .staticFramework,
            resources: ["Resources/**"],
            infoPlist: .default
        )
    }
}
