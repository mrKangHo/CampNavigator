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
            if let firstPhotoData = item.photos?.first, let firstPhoto = UIImage(data: firstPhotoData) {
                Image(uiImage: firstPhoto)
                    .resizable()
                    .clipShape(.rect(cornerRadius: 20))
            }
            
            VStack {
                HStack {
                    DateView(visitDates: [item.visitDates])
                        .frame(width: 80, height: 80)
                        .padding(10)
                    Spacer()
                }
                Spacer()
                PlaceView(campInfo: item)
                    .frame(maxHeight: 140)
                    .clipShape(.rect(topLeadingRadius: 12,
                                     topTrailingRadius: 12))
            }
            
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .frame(height: 400)
        
        
    }
}

#Preview {
    
    ReadItemView(item: CampPlace(name: "스칸디아", visitDates: Date(), photos: [ResourcesAsset.panda.image.pngData() ?? Data()], location: CampLocation(address: "서울 강남구 역삼동 12-1", latitude: 37.5, longitude: 126.95)))
}

