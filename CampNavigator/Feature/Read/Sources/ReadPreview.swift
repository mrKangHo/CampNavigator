//
//  ReadPreview.swift
//  Read
//
//  Created by LEE on 7/27/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import SwiftUI
import KHDesignSystem
import ComposableArchitecture
import SwiftData
import Domain
import Resources
@main
struct ReadPreview: App {
    
    init() {
        AnimationAsset.preload()
        KHFont.loadFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            let state = NormalListFeature.State()
            let reducer = Store(initialState: state) {NormalListFeature()}
            
            NormalListView(store: reducer).modelContainer(CampModelContainer.modelContainer)
        }
    }
}
#Preview {
    NormalListView(store: Store(initialState: NormalListFeature.State()) {NormalListFeature()})
}
