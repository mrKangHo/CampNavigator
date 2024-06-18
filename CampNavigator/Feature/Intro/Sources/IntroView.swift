//
//  FeatureTests.swift
//  ProjectDescriptionHelpers
//
//  Created by LEE on 2023/07/03.
//

import SwiftUI
import Resources
import Read

public struct IntroView: View {
    
    public init() {}
    
    public var body: some View {
        NavigationView { // NavigationView를 추가합니다.
            ZStack {
                Image(uiImage: ResourcesAsset.introWall.image) // 유효한지 확인해야 합니다.
                    .resizable(resizingMode: .stretch)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    HStack {
                        Text("특별했던 경험을\n기록해 보세요")
                            .multilineTextAlignment(.leading) // 다중 라인 텍스트 정렬
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    NavigationLink(destination: ReadView()) {
                        Text("시작해요")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 20)
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    IntroView()
}

