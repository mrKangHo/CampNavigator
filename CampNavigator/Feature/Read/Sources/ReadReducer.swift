//
//  ReadReducer.swift
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
public struct ReadReducer {
    @ObservableState
    public struct State: Equatable {
        public var count = 0
        public init() {} // public 초기화자
    }
    
    public enum Action: Equatable {
        case decrementButtonTapped
        case incrementButtonTapped
    }
    
    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .decrementButtonTapped:
                state.count -= 1
                return .none
            case .incrementButtonTapped:
                state.count += 1
                return .none
            }
        }
    }
}
