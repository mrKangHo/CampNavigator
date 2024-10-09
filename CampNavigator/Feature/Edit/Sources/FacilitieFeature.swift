//
//  FacilitieFeature.swift
//  Edit
//
//  Created by LEE on 10/9/24.
//  Copyright © 2024 LEE. All rights reserved.
//
import ComposableArchitecture


@Reducer
public struct FacilitieFeature {
    
    public init() {}
    
    @ObservableState
    public struct State {
        
    }
    
    public enum Action {
        
    }
    
    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            return .none
        }
    }
}
