//
//  ModuleProtocol.swift
//  Manifests
//
//  Created by LEE on 10/3/24.
//
import ProjectDescription

public protocol ModuleProtocol {
    var name: String { get }
    var includeTesting:Bool { get }
    var product:Product { get }
    var infoPlist:InfoPlist { get }
    var sources:SourceFilesList? { get }
    var resources:ResourceFileElements? { get }
    var dependencies:[TargetDependency] { get }
    var resourceSynthesizers: [ResourceSynthesizer] { get }
}
