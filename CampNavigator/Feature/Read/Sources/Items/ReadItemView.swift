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
import KHDesignSystem


public struct ReadItemView: View {
    
    
    public var item:CampPlace
    
    public init(item: CampPlace) {
        self.item = item
        KHFont.loadFonts()
    }
    
    
    public var body: some View {
        VStack {
            VStack {
                HStack {
                    Text(item.name)
                        .font(KHFont.Body.B03)
                    Spacer()
                }
                HStack {
                    Text(item.location?.address ?? "").font(KHFont.Caption.C04)
                    Spacer()
                }
            }.padding([.horizontal,.top], 8)
            
            ZStack {
                if let photo = item.photos?.first, let img = UIImage(data: photo) {
                    Image(uiImage: img)
                        .resizable()
                }
            }
            .frame(maxWidth: .infinity)
            .aspectRatio(1, contentMode: .fit)
            
            VStack {
                
                HStack {
                    Text(item.visitDates.formatted(.dateTime))
                        .font(KHFont.Callout.C04)
                    Spacer()
                }
                
                if let facility = item.facility?.map({"#\($0.name)"}).joined(separator: ", "){
                    Text(facility)
                        .font(KHFont.Callout.C04)
                        .foregroundStyle(KHColor.Primary.P10)
                        .frame(maxWidth: .infinity,
                               alignment: .leading)
                        .padding(.top, 4)
                    
                }
            }.padding(.all, 8)
            
            
        }
        .background(.white)
        
        
    }
}

#Preview {
    
    ReadItemView(item: CampPlace(name: "스칸디아", visitDates: Date(),facility: [CampFacility(name: "화장실")], photos: [ResourcesAsset.panda.image.pngData() ?? Data()], location: CampLocation(address: "서울 강남구 역삼동 12-1", latitude: 37.5, longitude: 126.95)))
}

