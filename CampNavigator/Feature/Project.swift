//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by LEE on 2023/07/03.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.feature()


fileprivate extension Project {
    static func feature() -> Project {
        return self.makeModule(
            module:.Feature,
            product: .staticLibrary,
            dependencies: [
                .Features.Read,
                .Features.Edit
            ])
    }
}
