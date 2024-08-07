//
//  CampLocation.swift
//  Domain
//
//  Created by LEE on 8/2/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import Foundation
import SwiftData

@Model
public class CampLocation:Equatable {
    public var address:String
    public var latitude: Double
    public var longitude: Double
    
    public init(address: String, latitude: Double, longitude: Double) {
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
    }
}
