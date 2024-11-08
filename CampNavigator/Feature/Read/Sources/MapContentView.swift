//
//  MapContentView.swift
//  Test
//
//  Created by LEE on 11/7/24.
//

import SwiftUI

struct MapContentView: View {
    var body: some View {
        
        HStack {
            Rectangle().frame(width: 100, height: 100).cornerRadius(10)
            VStack(alignment: .leading) {
                Text("플레이스")
                    .font(.headline)
                Text("위치")
                    .font(.subheadline)
                Text("방문 날짜")
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.thinMaterial)
        .cornerRadius(10)
    }
}

#Preview {
    MapContentView()
}
