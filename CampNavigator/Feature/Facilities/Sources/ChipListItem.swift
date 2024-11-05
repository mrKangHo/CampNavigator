//
//  ChipListItem.swift
//  Facilities
//
//  Created by LEE on 10/19/24.
//  Copyright © 2024 LEE. All rights reserved.
//

import SwiftUI

public struct ChipListItem: View {
    public init(text: String) {
        self.text = text
    }
    public var text: String
    
    public var body: some View {
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
    ChipListItem(text:"Chip")
}
