//
//  FeatureTests.swift
//  ProjectDescriptionHelpers
//
//  Created by LEE on 2023/07/03.
//

import SwiftUI
//import KHDesignSystem

public struct FilterView: View {
    public init() {}
    public  var body: some View {
        VStack {
            Text("Filter")
//                .font(KHFont.custom(.Bold, size: 40))
            // 여기에 더 많은 상세 정보 UI를 추가할 수 있습니다.
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FilterView()
}

