//
//  FacilitieView.swift
//  Edit
//
//  Created by LEE on 10/9/24.
//  Copyright © 2024 LEE. All rights reserved.
//

import SwiftUI
import KHDesignSystem
import ComposableArchitecture

public struct FacilitieView: View {
    
    public init(store: StoreOf<FacilitieFeature>) {
        self.store = store
        KHFont.loadFonts()
    }
    
    @Bindable public var store:StoreOf<FacilitieFeature>
    
    public var body: some View {

        Form {
            TextField("입력해 주세요",
                      text: $store.text.sending(\.updateText))
                .font(KHFont.Body.B05)
        }
        Spacer()


        Button {
            store.send(.added)
        } label: {
            Text("추가하기")
                .font(KHFont.Title.T05)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
        }
        .background(Color.blue)
       
        
    }
}

#Preview {
    FacilitieView(store: Store(initialState: FacilitieFeature.State(), reducer: {
        FacilitieFeature()
    }))
}
