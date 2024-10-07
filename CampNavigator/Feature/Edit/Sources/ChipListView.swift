//
//  ChipListView.swift
//  Edit
//
//  Created by LEE on 10/7/24.
//  Copyright © 2024 LEE. All rights reserved.
//

import SwiftUI

struct ChipListView: View {
    
    @Binding var chips:[String]

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(chips, id: \.self) { ss in
                    Chip(text: ss)
                }
                Spacer()
            }
        }
    }
}

struct Chip: View {
    var text: String
    
    var body: some View {
        Text(text)
            .padding(10)
            .background(Color.blue.opacity(0.2))
            .cornerRadius(20)
    }
}

#Preview {
    ChipListView(chips: .constant(["샤워실","데크"]))
}
