//
//  CampDataBase.swift
//  Data
//
//  Created by LEE on 8/2/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import Foundation
import SwiftData
import Dependencies
import Domain

extension DependencyValues {
    public var campPlace:CampDataBase {
        get { self[CampDataBase.self] }
        set { self[CampDataBase.self] = newValue }
    }
}

public struct CampDataBase {
    
    enum CampPlaceError: Error {
        case add
        case delete
    }
    
    
    public var fetchAll: @Sendable () throws -> [CampPlace]
    public var add: @Sendable (CampPlace) throws -> Void
    public var delete: @Sendable (CampPlace) throws -> Void
    
    
    
}

extension CampDataBase : DependencyKey {
    public static let liveValue = CampDataBase {
        do {
            @Dependency(\.databaseService.context) var context
            let campContext = try context()
            let descriptor = FetchDescriptor<CampPlace>(sortBy: [SortDescriptor(\.visitDates)])
            return try campContext.fetch(descriptor)
        }
        catch {
            return []
        }
    } add: { newPlace in
        do {
            @Dependency(\.databaseService.context) var context
            let campContext = try context()
            campContext.insert(newPlace)
        }
        catch {
            throw CampPlaceError.add
        }
    } delete: { deletePlace in
        do {
            @Dependency(\.databaseService.context) var context
            let campContext = try context()
            campContext.delete(deletePlace)
        }
        catch {
            throw CampPlaceError.delete
        }
    }

}
