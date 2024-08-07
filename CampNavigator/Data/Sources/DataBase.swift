//
//  DataBase.swift
//  Data
//
//  Created by LEE on 8/2/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import Foundation
import SwiftData
import Dependencies
import Domain

fileprivate let appContext: ModelContext = {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: false)
        let container = try ModelContainer(for: CampPlace.self, configurations: config)
        return ModelContext(container)
    }
    catch {
        fatalError("컨테이너 생설 실패")
    }
}()

struct DataBase {
    var context: () throws -> ModelContext
}

extension DataBase : DependencyKey {
    public static let liveValue = DataBase {
        appContext
    }
}

extension DependencyValues {
    var databaseService:DataBase {
        get { self[DataBase.self] }
        set { self[DataBase.self] = newValue }
    }
}
