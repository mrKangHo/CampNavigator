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



public struct EditView: View {
    @Environment(\.dismiss) var dismiss
    public init(store: StoreOf<EditFeature>) {
        KHFont.loadFonts()
        self.store = store
    }
    
    
    @Bindable public var store:StoreOf<EditFeature>
    
    public  var body: some View {
        
        ScrollView {
            VStack {
                TextField(text: $store.placeName.sending(\.updateName)) {
                    Text("캠핑장 이름")
                        .font(KHFont.Title.T01)
                }.font(KHFont.Title.T01)
                
                DatePicker(selection: $store.placeVisitDate.sending(\.updateDate), displayedComponents: .date) {
                    Text("방문 일자")
                        .font(KHFont.Body.B05)
                }
                .datePickerStyle(.compact)
                .font(KHFont.Body.B05)
                
                VStack {
                    Map(initialPosition: store.placeLocation)
//                        .onMapCameraChange { mapCameraUpdateContext in
//                            store.send(.updateLotions(mapCameraUpdateContext.region.center))
//                        }
                        .cornerRadius(8)
                        .frame(height: 180)
                    Text(store.address)
                        .font(KHFont.Body.B05)
                        .padding()
                }
                .background(.ultraThickMaterial)
                .cornerRadius(8)
                
                HStack {
                    PhotosPicker(selection: $store.selectedPhotoItems.sending(\.updatePhotos)) {
                        Image(systemName: "photo.badge.plus")
                    }.onChange(of: store.selectedPhotoItems, { oldValue, newValue in
                        Task {
                            if let newItem = newValue,
                               let data = try? await newItem.loadTransferable(type: Data.self){
                                store.send(.addPhoto(data))
                            }
                        }
                    }).padding()
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
                }
                .background(.ultraThickMaterial)
                .cornerRadius(8)
                
                VStack {
                    ChipListView(store: store.scope(state: \.chipListState, action: \.chipListAction))
                }.padding(.top, 20)
            }
            .padding([.leading, .top, .trailing], 20)
        }
        .alert($store.scope(state: \.alert, action: \.alert))
        
        Button {
            store.send(.alertButtonTapped)
        } label: {
            Text("저장하기")
                .font(KHFont.Title.T05)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
        }
        .background(Color.blue)
    }
}






#Preview {
    EditView(store: Store(initialState: EditFeature.State(), reducer: {
        EditFeature()
    }))
}
