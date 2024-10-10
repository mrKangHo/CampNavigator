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
        ScrollView(.horizontal) {
            HStack {
                ForEach(store.chips, id: \.self) { chip in
                    Chip(text: chip)
                }
                Spacer()
            }
        }
    }
}

struct Chip: View {
    var text: String
    
    var body: some View {
        HStack {
            Text(text).padding([.leading, .top, .bottom], 10)
                
            Button {
                
            } label: {
                Image(systemName: "xmark.circle")
            }.padding(.trailing, 10)
        }
        .background(Color.blue.opacity(0.2))
        .clipShape(Capsule())
        
    }
}

#Preview {
    
    ChipListView(store: Store(initialState: ChipListFeature.State(), reducer: {
        ChipListFeature()
    }))
    Spacer()
}
