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
            let state = ReadFeature.State()
            let reducer = Store(initialState: state) {ReadFeature()}
            
            ReadView(store: reducer).modelContainer(CampModelContainer.modelContainer)
        }
    }
}
#Preview {
    ReadView(store: Store(initialState: ReadFeature.State()) {ReadFeature()})
}
