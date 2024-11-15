//
//  PlaceView.swift
//  Read
//
//  Created by LEE on 8/30/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import SwiftUI
import Domain
import Resources
import KHDesignSystem

struct PlaceView: View {
    
    let campInfo:CampPlace
    
    var body: some View {
        GlassView(cornerRadius: 0).overlay {
            VStack {
                HStack {
                    Text(campInfo.name)
                        .foregroundStyle(.white)
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
                    Text(campInfo.location?.address ?? "")
                        .foregroundStyle(.white)
                    Image(systemName: "mappin.and.ellipse.circle")
                        .foregroundColor(.white)
                }
            }.padding(20)
        }.background(.blue)
        
    }
}

#Preview {
    PlaceView(campInfo: CampPlace(name: "스칸디아", visitDates: Date(), photos: [ResourcesAsset.panda.image.pngData() ?? Data()], location: CampLocation(address: "서울 강남구 역삼동 12-1", latitude: 37.5, longitude: 126.95)))
}
