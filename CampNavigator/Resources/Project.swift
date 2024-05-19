//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by LEE on 3/12/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.resources()

fileprivate extension Project {
    static func resources() -> Project {
        return self.makeModule(
            module:.Resources,
            product: .staticFramework,
            dependencies: [
//                .Projcet.Service
            ],
            resources: ["Resources/**"],
            infoPlist: .default
        )
    }
}
