//
//  PlaceView.swift
//  Read
//
//  Created by LEE on 8/30/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import SwiftUI
import KHDesignSystem

struct PlaceView: View {
    var body: some View {
        VStack {
            HStack {
                Text("스칸디 캠프팜").font(KHFont.subTitle03)
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "ellipsis")
                })
            }.padding(.vertical, 10)
            HStack {
                ZStack {
                    CirCleChipView(color: .red,
                                   image: Image(systemName: "map"))
                        .offset(x: 0, y: 0)
                    CirCleChipView(color: .blue,
                                   image: Image(systemName: "figure"))
                        .offset(x: 15, y: 0)
                    CirCleChipView(color: .green,
                                   image: Image(systemName: "sun.rain"))
                        .offset(x: 30, y: 0)
                }
                Spacer()
            }
            
            HStack {
                Spacer()
                Text("충남 보령").font(KHFont.body02)
                Image(systemName: "mappin.circle")
            }
            
            Spacer()
            
        }.padding(20)
        
    }
}

#Preview {
    PlaceView()
}
