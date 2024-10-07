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
@ViewAction(for: EditReducer.self)
public struct EditView: View {
    @Environment(\.dismiss) var dismiss
    public init(store: StoreOf<EditReducer>) {
        self.store = store
    }

    
   @Bindable public var store:StoreOf<EditReducer>
 
    public  var body: some View {
        
        ScrollView {
            VStack {
                TextField(text: .constant("")) {
                    Text("캠핑장 이름")
                }
                DatePicker(selection: .constant(Date()), displayedComponents: .date) {
                    Text("방문 일자")
                }.datePickerStyle(.compact)
                Map {
                    
                }
                .cornerRadius(8)
                .frame(height: 180)
                
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "photo")
                    }

                    ScrollView(.horizontal) {
                        LazyHStack {
                            PhotoItemView(Photo: ResourcesAsset.panda.swiftUIImage) {
                            }
                            PhotoItemView(Photo: ResourcesAsset.panda.swiftUIImage) {
                            }
                            PhotoItemView(Photo: ResourcesAsset.panda.swiftUIImage) {
                            }
                        }
                        
                    }
                    .frame(height: 140)
                }.cornerRadius(8)
                
                ChipListView(chips: .constant(["샤워실","화장실"]))
                
                
                
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
       
        Button {
            send(.savePlace)
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
