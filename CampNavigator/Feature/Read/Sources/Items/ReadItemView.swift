//
//  ReadItemView.swift
//  Read
//
//  Created by LEE on 3/28/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import SwiftUI
import Resources
import Data
import Domain

public struct ReadItemView: View {
    
    
    public var item:CampPlace
    
    public init(item: CampPlace) {
        self.item = item
    }
    
    
    public var body: some View {
        ZStack {
            
            Image(asset: ResourcesAsset.introWall)
                .resizable()
                .clipShape(.rect(cornerRadius: 20))
            VStack {
                HStack {
                    DateView()
                        .frame(width: 60, height: 80)
                        .padding(10)
                    Spacer()
                }
                Spacer()
                PlaceView()
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .background(.white)
                    .clipShape(.rect(cornerRadius: 20))
                    .padding(10)
            }
            
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .frame(height: 400)
        
        
    }
}

#Preview {
    ReadItemView(item: CampPlace(name: "스칸디아", visitDates: Date()))
}

