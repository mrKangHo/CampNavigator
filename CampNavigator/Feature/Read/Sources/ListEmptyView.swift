//
//  ListEmptyView.swift
//  Read
//
//  Created by LEE on 10/3/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import SwiftUI
import KHDesignSystem
import Resources
import Lottie

public struct ListEmptyView: View {

    public init() {
        
    }
    public var body: some View {
        VStack(alignment: .center) {
            LottieView {
                AnimationAsset.empty.animation
            }.playing(loopMode: .loop)
            .resizable()
            .frame(width: 300, height: 300)
            Text("방문한곳이 없네요")
                .font(KHFont.Body.B02)
                .foregroundStyle(KHColor.Gray.GR90)
            
        }
        
        
    }
}

#Preview {
    EmptyView()
}
