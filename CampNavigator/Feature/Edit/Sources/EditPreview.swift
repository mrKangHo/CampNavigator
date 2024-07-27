//
//  EditPreview.swift
//  Edit
//
//  Created by LEE on 7/27/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import SwiftUI
import KHDesignSystem


@main
struct EditPreview: App {
    
    init() {
        KHFont.loadFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            EditView()
        }
    }
}
#Preview {
    EditView()
}

