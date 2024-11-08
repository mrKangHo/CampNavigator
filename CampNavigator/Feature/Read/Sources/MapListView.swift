//
//  MapListView.swift
//  Read
//
//  Created by LEE on 11/8/24.
//  Copyright © 2024 LEE. All rights reserved.
//

import SwiftUI
import KHDesignSystem
import ComposableArchitecture
import Resources
import Lottie
import Edit
import SwiftData
import MapKit

public struct MapListView: View {
    
    public init(store: StoreOf<MapListFeature>) {
        self.store = store
    }
    
    @Bindable var store:StoreOf<MapListFeature>
    
    public var body: some View {
        
        Map {
            ForEach(store.items) { item in
                
                Marker(item.name, coordinate: CLLocationCoordinate2D(latitude: item.location?.latitude ?? 0,
                                                                     longitude: item.location?.longitude ?? 0))
                
            }
        }
        .mapStyle(.hybrid)
        .mapControls {
            MapUserLocationButton()
            MapCompass()
            MapScaleView()
        }
        .onAppear() {
            store.send(.didApear)
        }
    }
}

#Preview {
    MapListView(store: Store(initialState: MapListFeature.State()) {MapListFeature()})
}
