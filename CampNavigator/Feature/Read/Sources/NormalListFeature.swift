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
    public struct State {
        
        
        public init() {}
        public var items:[CampPlace] = []
        public var isShowAddView:Bool = false
        public var selectedItem:CampPlace?
        @Presents var confirmationDialog: ConfirmationDialogState<Action.ConfirmationDialog>?
        
    }
    
    public enum Action: Equatable {
        case didApear
        case fetch([CampPlace])
        case confirmationDialog(PresentationAction<ConfirmationDialog>)
        case confirmationDialogButtonTapped(CampPlace)
        case setAddView(isPresented:Bool)
        
        
        
        @CasePathable
        public enum ConfirmationDialog {
            case editButtonTapped
            case deleteButtonTapped
        }
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
            case .confirmationDialog(.presented(.editButtonTapped)):
                return .none
                
            case .confirmationDialog(.presented(.deleteButtonTapped)):
                return .run { [state = state] send in
                    if let deleteItem = state.selectedItem {
                        try self.campPlace.delete(deleteItem)
                    }
                    let items = try self.campPlace.fetchAll()
                    await send(.fetch(items))
                }
            case .confirmationDialog:
                return .none
            case .confirmationDialogButtonTapped(let selectedItem):
                state.selectedItem = selectedItem
                state.confirmationDialog = ConfirmationDialogState {
                    TextState("Confirmation dialog")
                } actions: {
                    ButtonState(role: .cancel) {
                        TextState("취소")
                    }
                    ButtonState(action: .editButtonTapped) {
                        TextState("수정하기")
                    }
                    ButtonState(action: .deleteButtonTapped) {
                        TextState("삭제하기")
                    }
                } message: {
                    TextState("\(selectedItem.name)을 어떻게 할까요?")
                }
                return .none
            case .setAddView(isPresented: true):
                state.isShowAddView = true
                return .none
            case .setAddView(isPresented: false):
                state.isShowAddView = false
                return .none
            }
        }
        .ifLet(\.$confirmationDialog, action: \.confirmationDialog)
    }
}
