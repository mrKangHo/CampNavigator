//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by LEE on 3/20/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.readFeature()


fileprivate extension Project {
    static func readFeature() -> Project {
        return self.makeSubFeature(featureName: "Read",
                                   product: .staticLibrary,
                                   dependencies: [
//                                    .Projcet.Data,
//                                                  .Projcet.Domain,
                                                  .Projcet.Resources,
                                                  .Projcet.ThirdPartyLib,
                                                  .Projcet.Edit])
    }
}
