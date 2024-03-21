//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by LEE on 3/12/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.data()

fileprivate extension Project {
    static func data() -> Project {
        return self.makeModule(
            module:.Data,
            product: .staticFramework,
            dependencies: [
                .Projcet.Infrastructure,
            ],
            resources: ["Resources/**"]
        )
    }
}
