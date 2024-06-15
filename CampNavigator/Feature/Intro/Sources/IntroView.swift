//
//  FeatureTests.swift
//  ProjectDescriptionHelpers
//
//  Created by LEE on 2023/07/03.
//

import SwiftUI
import Resources

public struct IntroView: View {
    
    public init() {}
    
    public var body: some View {
        
        
        
        Image(uiImage: ResourcesAsset.introWall.image).resizable(resizingMode: .stretch).ignoresSafeArea()
        
        
    }
}

#Preview {
    IntroView()
}

