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
        public var chips:[String] = []
    }
    
    public enum Action {
        
    }
    
    public var body: some Reducer<State, Action> {
        EmptyReducer()
    }
}
