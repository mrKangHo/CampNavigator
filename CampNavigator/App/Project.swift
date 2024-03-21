//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by LEE on 2023/07/03.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app()


fileprivate extension Project {
    static func app() -> Project {
        
        return self.makeModule(
            module: .App,
            product: .app,
            dependencies: [
                .Projcet.Feature
            ],
            resources: ["Resources/**"],
            infoPlist: .extendingDefault(with: [
                "UIMainStoryboardFile": "",
                "UILaunchStoryboardName": "Launch Screen",
                "ENABLE_TESTS": .boolean(true),
            ]))
    }
}
