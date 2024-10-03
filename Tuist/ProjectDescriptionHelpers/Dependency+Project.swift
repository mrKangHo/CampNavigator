//
//  Dependency+Project.swift
//  ProjectDescriptionHelpers
//
//  Created by LEE on 2023/07/03.
//

import ProjectDescription

public extension TargetDependency {
    enum Projcet {}
}

public extension TargetDependency {
    enum Features {}
}


public extension TargetDependency.Projcet {
    
    static let ThirdPartyLib = TargetDependency.project(target: "ThirdPartyLib", 
                                                        path: .relativeToRoot("CampNavigator/ThirdPartyLib"))
    
    static let Core = TargetDependency.project(target: "Core", 
                                               path: .relativeToRoot("CampNavigator/Core"))
    static let Data = TargetDependency.project(target: "Data", 
                                               path: .relativeToRoot("CampNavigator/Data"))
    static let Domain = TargetDependency.project(target: "Domain", 
                                                 path: .relativeToRoot("CampNavigator/Domain"))
    static let Infrastructure = TargetDependency.project(target: "Infrastructure", 
                                                         path: .relativeToRoot("CampNavigator/Infrastructure"))
    static let Resources = TargetDependency.project(target: "Resources", 
                                                    path: .relativeToRoot("CampNavigator/Resources"))
}


public extension TargetDependency.Projcet {
    static let Intro:TargetDependency = .project(target: "Intro",
                                                path: .relativeToRoot("CampNavigator/Feature/Intro"))
    static let Read:TargetDependency = .project(target: "Read",
                                                path: .relativeToRoot("CampNavigator/Feature/Read"))
    static let Edit:TargetDependency = .project(target: "Edit", 
                                                path: .relativeToRoot("CampNavigator/Feature/Edit"))
    static let Filter:TargetDependency = .project(target: "Filter",
                                                path: .relativeToRoot("CampNavigator/Feature/Filter"))
    
}
