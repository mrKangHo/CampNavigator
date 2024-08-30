//
//  CirCleChipView.swift
//  Read
//
//  Created by LEE on 8/30/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import SwiftUI

struct CirCleChipView: View {
    
    var color: Color
    var image:Image
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: 30, height: 30)
            .overlay(
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14, height: 14)
                    .foregroundColor(.white)
            )
    }
}

#Preview {
    CirCleChipView(color: .red,
                   image: Image(systemName: "map"))
}
