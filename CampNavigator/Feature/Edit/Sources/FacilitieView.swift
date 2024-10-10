//
//  FacilitieView.swift
//  Edit
//
//  Created by LEE on 10/9/24.
//  Copyright © 2024 LEE. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

public struct FacilitieView: View {
    
    public init(store: StoreOf<FacilitieFeature>) {
        self.store = store
     
    }
    
    @Bindable public var store:StoreOf<FacilitieFeature>
    
    public var body: some View {

        VStack {
            TextField("입력해 주세요", text: $store.text.sending(\.updateText))
                        .padding()
                        .background(store.bgColor)
                        .clipShape(Capsule())
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
            ColorPicker("배경 컬러를 선택해주세요",
                        selection: $store.bgColor.sending(\.updateBGColor))
            Spacer()
            Button {
                store.send(.added)
            } label: {
                Text("추가하기").foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .background(.blue)
            .cornerRadius(8)
            
                
        }.padding()
   
        
        

        
    }
}

#Preview {
    FacilitieView(store: Store(initialState: FacilitieFeature.State(), reducer: {
        FacilitieFeature()
    }))
}
