//
//  CampPlace.swift
//  Domain
//
//  Created by LEE on 8/2/24.
//  Copyright © 2024 COKE. All rights reserved.
//
import Foundation
import SwiftData
import SwiftUICore
import CoreLocation

@Model
public class CampPlace {
    public var name:String
    public var visitDates:[Date]
    public var facility:[CampFacility]
    public var photos:[Data]?
    public var location:CampLocation
    @Attribute(.unique) public var id:UUID = UUID()
    
    public init(name: String, visitDates: [Date], facility: [CampFacility], photos: [Data]? = nil, location: CampLocation, id: UUID) {
        self.name = name
        self.visitDates = visitDates
        self.facility = facility
        self.photos = photos
        self.location = location
        self.id = id
    }
    
    
}
