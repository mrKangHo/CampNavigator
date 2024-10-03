//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by LEE on 3/12/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.domain()

fileprivate extension Project {
    static func domain() -> Project {
        return self.makeModule(
            module:.Domain,
            product: .framework,
            dependencies: [
                .Projcet.Core
            ],
            resources: ["Resources/**"],
            infoPlist: .default
        )
    }
}
