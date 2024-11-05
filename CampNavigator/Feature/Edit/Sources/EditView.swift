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
import PhotosUI
import Facilities


@ViewAction(for: EditFeature.self)
public struct EditView: View {
    @Environment(\.dismiss) var dismiss
    public init(store: StoreOf<EditFeature>) {
        self.store = store
    }
    
    
    @Bindable public var store:StoreOf<EditFeature>
    
    public  var body: some View {
        
        ScrollView {
            VStack {
                
                TextField(text: $store.placeName.sending(\.updateName)) {
                    Text("캠핑장 이름")
                }
                DatePicker(selection: $store.placeVisitDate.sending(\.updateDate), displayedComponents: .date) {
                    Text("방문 일자")
                }.datePickerStyle(.compact)
                
                Map(initialPosition: store.placeLocation)
                    .onMapCameraChange { mapCameraUpdateContext in
                        send(.updateLotions(mapCameraUpdateContext.region.center))
                    }
                    .cornerRadius(8)
                    .frame(height: 180)
                
                Text(store.address)
                
                HStack {
                    PhotosPicker(selection: $store.selectedPhotoItems.sending(\.updatePhotos)) {
                        Image(systemName: "photo")
                    }.onChange(of: store.selectedPhotoItems, { oldValue, newValue in
                        Task {
                            if let newItem = newValue,
                               let data = try? await newItem.loadTransferable(type: Data.self){
                                send(.addPhoto(data))
                            }
                        }
                    })
                   
                    
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(store.photos, id: \.self) { photoData in
                                if let uiImage = UIImage(data: photoData) {
                                    PhotoItemView(Photo: Image(uiImage: uiImage)) {
                                        // 이미지 클릭 시 동작
                                    }
                                }
                            }
                            
                        }
                        
                    }
                    .frame(height: 140)
                }.cornerRadius(8)
                
                VStack {
                    ChipListView(store: store.scope(state: \.chipListState, action: \.chipListAction))
                }
            }.padding([.leading, .trailing], 20)
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
    EditView(store: Store(initialState: EditFeature.State(), reducer: {
        EditFeature()
    }))
}
