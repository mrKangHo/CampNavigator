//
//  DateView.swift
//  Read
//
//  Created by LEE on 8/30/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import SwiftUI
import KHDesignSystem

struct DateView: View {
    var body: some View {
        VStack {
            Text("Dec")
                .font(KHFont.body01)
                .padding(.bottom, 4)
            Text("22")
                .font(KHFont.subTitle02)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    DateView()
}
