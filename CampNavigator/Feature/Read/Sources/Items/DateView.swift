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
    
    var visitDates:[Date]
    var visitCount:String {
        let count = self.visitDates.count
        return count > 1 ? "\(count)번째 방문" : "첫 방문"
    }
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            GlassView(cornerRadius: 10)
            VStack {
                Text(self.convertDate(visitDates.first ?? Date(), format: "MMM").uppercased())
                    .foregroundStyle(KHColor.Gray.GR50)
                Text(self.convertDate(visitDates.first ?? Date(), format: "dd"))
                    .padding(.bottom, 4)
                Text(visitCount)
                    .foregroundStyle(KHColor.Label.LB30)
                    .padding(.bottom, 4)
            }

        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}


extension DateView {
    
    
    
    
    func convertDate(_ date:Date, format:String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}


#Preview {
    DateView(visitDates: [Date()])
}
