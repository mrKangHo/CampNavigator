//
//  ReadItemView.swift
//  Read
//
//  Created by LEE on 3/28/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import SwiftUI
import Resources

struct ReadItemView: View {
    var item:String
    var body: some View {
        ZStack {
            GlassView(cornerRadius: 10)
            Image(asset: ResourcesAsset.sample).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
            Text(item)
        }
        
        
    }
}

#Preview {
    ReadItemView(item: "이강호")
}

