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
            product: .staticFramework,
            packages: [],
            dependencies: [
                            .SPM.TCA,
                            .SPM.Alamofire
            ],
            infoPlist: .default
        )
    }
}
