//
//  MapListFeature.swift
//  Read
//
//  Created by LEE on 11/8/24.
//  Copyright © 2024 LEE. All rights reserved.
//

import Foundation
import ComposableArchitecture
import Dependencies
import SwiftData
import Domain
import Data

@Reducer
public struct MapListFeature {
    public init(){}
    
    @ObservableState
    public struct State: Equatable {
        public init() {}
        public var items:[CampPlace] = []
        public var selectedItem:CampPlace?
        
    }
    
    public enum Action: Equatable {
        case didApear
        case fetch([CampPlace])
        case choiceCamp(CampPlace?)
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
            case .choiceCamp(let item):
                state.selectedItem = item
                print("LEEE___\(item?.name)")
                return .none
            }
        }
    }
}
