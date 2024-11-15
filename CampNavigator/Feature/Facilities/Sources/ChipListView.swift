//
//  ChipListView.swift
//  Edit
//
//  Created by LEE on 10/7/24.
//  Copyright © 2024 LEE. All rights reserved.
//

import SwiftUI
import KHDesignSystem
import ComposableArchitecture

public struct ChipListView: View {
    public init(store: StoreOf<ChipListFeature>) {
        KHFont.loadFonts()
        self.store = store
    }
    @Bindable public var store:StoreOf<ChipListFeature>
    
    

    public var body: some View {
        
        HStack {
            Text("시설 정보")
                .font(KHFont.Body.B05)
            Spacer()
            Button {
                store.send(.addChip(true))
            } label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 26, height: 26)
            }
        }.sheet(isPresented: $store.isShowFacilities.sending(\.addChip)) {
            FacilitieView(store: store.scope(state: \.facilitiesState, action: \.facilitiesAction))
                .presentationDetents([.height(180)])
                .presentationCompactAdaptation(.none)
        }
        
        ScrollView(.horizontal) {
            HStack {
                ForEach(store.chips, id: \.self) { chip in
                    
                    Button {
                        
                    } label: {
                        HStack(spacing: 0, content: {
                            Text("#\(chip)")
                                .font(KHFont.Callout.C04)
                                .foregroundStyle(KHColor.Primary.P10)
                                
                        })
                    }
                }
                Spacer()
            }
        }
    }
}


#Preview {
    
    ChipListView(store: Store(initialState: ChipListFeature.State(["aaaa","bbbb","aaaa","bbbb","aaaa","bbbb","aaaa","bbbb","aaaa","bbbb","aaaa","bbbb","aaaa","bbbb"]), reducer: {
        ChipListFeature()
    }))
    Spacer()
}
