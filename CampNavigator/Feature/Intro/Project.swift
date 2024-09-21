//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by LEE on 6/9/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.introFeature()


fileprivate extension Project {
    static func introFeature() -> Project {
        return self.makeSubFeature(featureName: "Intro",
                                   product: .framework,
                                   dependencies: [
                                                .Projcet.Data,
                                                .Projcet.Domain,
                                                .Projcet.Resources,
                                                .Projcet.ThirdPartyLib,
                                                .Projcet.Read
                                   ])
    }
}
