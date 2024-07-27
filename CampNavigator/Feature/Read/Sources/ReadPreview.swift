//
//  ReadPreview.swift
//  Read
//
//  Created by LEE on 7/27/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import SwiftUI
import KHDesignSystem


@main
struct ReadPreview: App {
    
    init() {
        KHFont.loadFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            ReadView()
        }
    }
}
#Preview {
    ReadView()
}
