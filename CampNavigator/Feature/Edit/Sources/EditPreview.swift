//
//  EditPreview.swift
//  Edit
//
//  Created by LEE on 7/27/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import SwiftUI
import KHDesignSystem
import ComposableArchitecture
import Domain

@main
struct EditPreview: App {
   
    init() {
        KHFont.loadFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            EditView(store: Store(initialState: EditReducer.State(), reducer: {
                EditReducer()
            })).modelContainer(CampModelContainer.modelContainer)
        }
    }
}
#Preview {
    EditView(store: Store(initialState: EditReducer.State(), reducer: {
        EditReducer()
    }))
}

