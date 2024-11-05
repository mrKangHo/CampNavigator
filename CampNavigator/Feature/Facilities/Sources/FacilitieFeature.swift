//
//  FacilitieFeature.swift
//  Edit
//
//  Created by LEE on 10/9/24.
//  Copyright © 2024 LEE. All rights reserved.
//
import ComposableArchitecture
import SwiftUI


@Reducer
public struct FacilitieFeature {
    
    public init() {}
    
    @ObservableState
    public struct State {
        public init() {}
            
        public var bgColor:Color = .red
        public var text:String = ""
    }
    
    public enum Action {
        case updateBGColor(Color)
        case updateText(String)
        case added
    }
    
    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .updateBGColor(let newColor):
                state.bgColor = newColor
                return .none
            case .updateText(let newText):
                state.text = newText
                return .none
            case .added:
                return .none
            }
        }
    }
}
