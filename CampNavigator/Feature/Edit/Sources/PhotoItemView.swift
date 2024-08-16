//
//  PhotoItemView.swift
//  Edit
//
//  Created by LEE on 7/29/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import SwiftUI
import Resources
import KHDesignSystem

public struct PhotoItemView: View {
    public var Photo:Image
    public var onDelete:() -> Void
    
    public var body: some View {
        
        ZStack(alignment: .topTrailing) {
            Photo.resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 140, height: 140)
                .clipped()
                .cornerRadius(8).onTapGesture {
                    print("KANGHO")
                    onDelete()
                }
            Button {
                
            } label: {
                Image(systemName: "xmark.circle").resizable()
                    .foregroundColor(KHColor.Gray.GR10)
                    .frame(width: 14, height: 14)
                    .padding(6)
                    .background(KHColor.Gray.GR90.opacity(0.7))
                    .cornerRadius(8)
            }
        }
        
        
    }
}

#Preview {
    PhotoItemView(Photo: ResourcesAsset.sample.swiftUIImage) {
        
    }
}
