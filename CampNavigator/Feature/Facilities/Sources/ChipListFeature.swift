//
//  ChipListFeature.swift
//  Edit
//
//  Created by LEE on 10/10/24.
//  Copyright © 2024 LEE. All rights reserved.
//

import ComposableArchitecture

@Reducer
public struct ChipListFeature {
    
    public init() {}
    
    @ObservableState
    public struct State {
        public init(_ chips:[String]) {
            self.chips = chips
        }
        public var chips:[String]
        public var isShowFacilities:Bool = false
        public var facilitiesState:FacilitieFeature.State = FacilitieFeature.State()
        
    }
    
    public enum Action {
        case addChip(Bool)
        case facilitiesAction(FacilitieFeature.Action)
    }
    
    public var body: some Reducer<State, Action> {
        Scope(state: \.facilitiesState, action: \.facilitiesAction) {
            FacilitieFeature()
        }
        Reduce { state, action in
            switch action {
            case .addChip(let isPresented):
                state.isShowFacilities = isPresented
                return .none
            case .facilitiesAction(\.added):
                state.chips.append(state.facilitiesState.text)
                state.facilitiesState = FacilitieFeature.State()
                state.isShowFacilities = false
                return .none
            case .facilitiesAction:
                return .none
            }
        }
        
    }
}
