//
//  IntroPreview.swift
//  Intro
//
//  Created by LEE on 7/27/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import SwiftUI
import KHDesignSystem


@main
struct IntroPreview: App {
    
    init() {
        KHFont.loadFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            IntroView()
        }
    }
}
#Preview {
    IntroView()
}

