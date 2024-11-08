//
//  NormalListFeature.swift
//  Read
//
//  Created by LEE on 8/2/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import Foundation
import ComposableArchitecture
import Dependencies
import SwiftData
import Domain
import Data

@Reducer
public struct NormalListFeature {
    
    public init(){}
    
    @ObservableState
    public struct State: Equatable {
        public init() {}
        public var items:[CampPlace] = []
        
    }
    
    public enum Action: Equatable {
        case didApear
        case fetch([CampPlace])
    }
    
    @Dependency(\.campPlace) var campPlace
    
    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .didApear:
                
                return .run { send in
                    let items = try self.campPlace.fetchAll()
                    await send(.fetch(items))
                }
            case .fetch(let items):
                state.items = items
                return .none
            }
        }
    }
}
