//
//  ReadView.swift
//  Read
//
//  Created by LEE on 3/22/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import SwiftUI

public struct ReadView: View {
    
    public init() {}
    
    let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    
    public var body: some View {
        ZStack {
            // 배경 색상
            LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.5), Color.red.opacity(0.3)]), startPoint: .topTrailing, endPoint: .bottom)
                            .edgesIgnoringSafeArea(.all)
                        
            
            ScrollView(.vertical, showsIndicators: false) {
                       VStack(spacing: 10) {
                           ForEach(items, id: \.self) { item in
                               ReadItemView(item:item)
                                   .frame(height: 150)
                                   .frame(maxWidth: .infinity)
                                   .cornerRadius(10)
                           }
                       }
                       .padding(10)
                   }
            
        }
        
    }
}

#Preview {
    ReadView()
}
