//
//  CampFacility.swift
//  Domain
//
//  Created by LEE on 8/2/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import Foundation
import SwiftData

@Model
public class CampFacility:Equatable {
    public var name:String
    @Attribute(.unique) public var id:UUID = UUID()
    
    public init(name: String, id: UUID) {
        self.name = name
        self.id = id
    }
}
