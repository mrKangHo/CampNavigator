//
//  CampModelContainer.swift
//  Domain
//
//  Created by LEE on 8/20/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import Foundation
import SwiftData


public struct CampModelContainer {
    static public var modelContainer: ModelContainer = {
        let schema = Schema([CampPlace.self, CampFacility.self, CampLocation.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
}
