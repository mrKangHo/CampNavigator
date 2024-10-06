//
//  EditView.swift
//  Edit
//
//  Created by LEE on 3/22/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import SwiftUI
import KHDesignSystem
import Resources
import ComposableArchitecture
import Domain
import MapKit

public struct EditView: View {
    @Environment(\.dismiss) var dismiss
    public init(store: StoreOf<EditReducer>) {
        self.store = store
    }

    
   @Bindable public var store:StoreOf<EditReducer>
 
    public  var body: some View {
       
        
        TextField(text: .constant("")) {
            Text("캠핑장 이름")
        }
        DatePicker(selection: .constant(Date()), displayedComponents: .date) {
            Text("방문 일자")
        }
        
        Text("시설 정보")
        
        
        Text("사진")
        
        ScrollView(.horizontal) {
            PhotoItemView(Photo: ResourcesAsset.sample.swiftUIImage) {
            }
        }
        Map {
            
        }.frame(height: 180)
        Spacer()
        Button {
            store.send(.savePlace)
        } label: {
            Text("저장하기")
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
        }.background(Color.blue).frame(width: .infinity)

        
    }
}






#Preview {
    EditView(store: Store(initialState: EditReducer.State(), reducer: {
        EditReducer()
    }))
}
