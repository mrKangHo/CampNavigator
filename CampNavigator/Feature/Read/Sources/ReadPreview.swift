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

@main
struct ReadPreview: App {
    
    init() {
        KHFont.loadFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            ReadView(name: "")
        }
    }
}
#Preview {
    ReadView(name: "")
}
