//
//  ReadItemView.swift
//  Read
//
//  Created by LEE on 3/28/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import SwiftUI

struct ReadItemView: View {
    var item:String
    var body: some View {
        ZStack {
            // 배경 색상
            GlassView(cornerRadius: 10)
            Text(item)
        }
        
        
    }
}

#Preview {
    ReadItemView(item: "이강호")
}

