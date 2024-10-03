//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by LEE on 2023/07/03.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.thirdPartyLib()


fileprivate extension Project {
    static func thirdPartyLib() -> Project {
        
        return self.makeModule(
            module: .ThirdPartyLib,
            product: .framework,
            packages: [],
            dependencies: [ .SPM.TCA,
                            .SPM.Lottie,
                            .SPM.KHDesignSystem
            ],
            infoPlist: .default
        )
    }
}
