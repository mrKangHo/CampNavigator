//
//  EditView.swift
//  Edit
//
//  Created by LEE on 3/22/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import SwiftUI
import KHDesignSystem

public struct EditView: View {
    public init() {}
    public  var body: some View {
        VStack {
            Text("Detail for")
                .font(KHFont.custom(.Bold, size: 40))
            // 여기에 더 많은 상세 정보 UI를 추가할 수 있습니다.
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    EditView()
}
