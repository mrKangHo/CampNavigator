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
@main
struct ReadPreview: App {
    
    init() {
        KHFont.loadFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            let state = ReadReducer.State()
            let reducer = Store(initialState: state) {ReadReducer()}
            
            ReadView(store: reducer).modelContainer(CampModelContainer.modelContainer)
        }
    }
}
#Preview {
    ReadView(store: Store(initialState: ReadReducer.State()) {ReadReducer()})
}
