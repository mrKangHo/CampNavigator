//
//  MapPinView.swift
//  Test
//
//  Created by LEE on 11/7/24.
//

import SwiftUI

struct MapPinView: View {
    
    var isSelected:Bool
    
    var symbol:String = ""
    
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.teal)
                .frame(width: isSelected ? 50 : 30, height: isSelected ? 50 : 30)
            Text(symbol)
                .padding(5)
                .font(isSelected ? .title : .body)
        }
    }
}



#Preview {
    MapPinView(isSelected: false)
}
