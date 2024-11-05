//
//  ChipListView.swift
//  Edit
//
//  Created by LEE on 10/7/24.
//  Copyright © 2024 LEE. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

public struct ChipListView: View {
    public init(store: StoreOf<ChipListFeature>) {
        self.store = store
    }
    @Bindable public var store:StoreOf<ChipListFeature>
    
    

    public var body: some View {
        
        HStack {
            Text("시설 정보")
            Spacer()
            Button {
                store.send(.addChip(true))
            } label: {
                Text("추가하기")
            }
        }.sheet(isPresented: $store.isShowFacilities.sending(\.addChip)) {
            FacilitieView(store: store.scope(state: \.facilitiesState, action: \.facilitiesAction))
        }
        
        ScrollView(.horizontal) {
            HStack {
                ForEach(store.chips, id: \.self) { chip in
                    ChipListItem(text: chip)
                }
                Spacer()
            }
        }
    }
}


#Preview {
    
    ChipListView(store: Store(initialState: ChipListFeature.State([]), reducer: {
        ChipListFeature()
    }))
    Spacer()
}
