//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by LEE on 6/9/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.filterFeature()


fileprivate extension Project {
    static func filterFeature() -> Project {
        return self.makeSubFeature(featureName: "Filter",
                                   product: .staticLibrary,
                                   dependencies: [
//                                                .Projcet.Data,
//                                                  .Projcet.Domain,
//                                                  .Projcet.Resources,
//                                                  .Projcet.ThirdPartyLib
                                   ])
    }
}
