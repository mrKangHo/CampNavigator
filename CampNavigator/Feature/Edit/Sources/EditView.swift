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

    public init(store: StoreOf<EditReducer>) {
        self.store = store
    }

    
   @Bindable public var store:StoreOf<EditReducer>
 
    public  var body: some View {
        VStack {
            
            KHTextField(text: $store.editInfo.name.sending(\.updateName),
                         placeHolder: "캠핑장의 이름은 어떻게 되나요?",
                         symboldIcon:Image(systemName: "pencil"))
            DatePicker("방문은 언제했나요?", selection: $store.editInfo.visitDates.sending(\.updateVisitDate), displayedComponents: .date).font(KHFont.subTitle02)
            
//            KHTextField(text: $store.name.sending(\.updateName),
//                        placeHolder: "시설은?",
//                        symboldIcon:Image(systemName: "pencil"))
            
            
            
            Map(coordinateRegion: $store.mapCoordinateRegion.sending(\.updateLocation))
                .frame(maxWidth: .infinity)
                .frame(height: 140)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            Text(store.address).font(KHFont.body01)
            HStack {
                Button(action: {}, label: {
                    Image(systemName: "photo.badge.plus.fill")
                        .foregroundStyle(.white)
                        .frame(width: 40,height: 140)
                }).background(KHColor.Primary.P10)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                
                if let photos = store.editInfo.photos {
                    ScrollView(.horizontal) {
                        HStack(spacing: 16) {
                            ForEach(photos.indices, id: \.self) { index in
                                PhotoItemView(Photo: ResourcesAsset.panda.swiftUIImage) {
                                    store.send(.removePhotoSelected(index))
                                }
                            }
                        }
                        .padding()
                        .alert($store.scope(state: \.alert, action: \.alert))
                        
                        
                    }
                }
                else {
                    Text("사진을 등록해 주세요")
                        .font(KHFont.subTitle01)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                
                
                

                
            }
            
            Spacer()
            KHButton(title: "확인", action: {
                store.send(.savePlace)
            }, KHButtonStyle(background: KHColor.Primary.P00, 12)).foregroundColor(.white).frame(height: 50)
        }.padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}






#Preview {
    EditView(store: Store(initialState: EditReducer.State(), reducer: {
        EditReducer()
    }))
}
