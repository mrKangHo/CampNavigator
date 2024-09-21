//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by LEE on 3/20/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.editFeature()


fileprivate extension Project {
    static func editFeature() -> Project {
        return self.makeSubFeature(featureName: "Edit",
                                   product: .framework,
                                   dependencies: [.Projcet.Data,
                                                  .Projcet.Domain,
                                                  .Projcet.Resources,
                                                  .Projcet.ThirdPartyLib])
    }
}
