//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by LEE on 3/12/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.infrastructure()


fileprivate extension Project {
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
}
