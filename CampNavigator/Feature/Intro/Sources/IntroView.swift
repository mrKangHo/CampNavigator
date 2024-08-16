//
//  FeatureTests.swift
//  ProjectDescriptionHelpers
//
//  Created by LEE on 2023/07/03.
//

import SwiftUI
import Resources
import KHDesignSystem
import Read

public struct IntroView: View {
    
    public init() {
    }
    @State private var isNavigatingToB = false
    public var body: some View {
        NavigationView { // NavigationView를 추가합니다.
            ZStack {
                Image(uiImage: ResourcesAsset.introWall.image)
                    .resizable(resizingMode: .stretch)
                    .ignoresSafeArea()
                
                VStack {
                    
                    Spacer()
                    HStack {
                        
                        Text("특별했던 경험을\n기록해 보세요")
                            .font(KHFont.subTitle01)
                            .foregroundStyle(.white)
                            .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.leading) // 다중 라인 텍스트 정렬
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                    Button("시작해요") {
                        isNavigatingToB = true
                    }.font(KHFont.custom(.Medium, size: 20)).frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10).padding(.bottom, 20)
                }
                .padding(.horizontal, 20)
            }
            .fullScreenCover(isPresented: $isNavigatingToB) {
                ReadView()
            }
        }
    }
}

#Preview {
    IntroView()
}
