//
//  EditView.swift
//  Edit
//
//  Created by LEE on 3/22/24.
//  Copyright © 2024 COKE. All rights reserved.
//

import SwiftUI
import KHDesignSystem
import Resources
 
public struct EditView: View {
    public init() {}
    @State public var name:String = ""
    @State public var visitDate:Date = Date()
    @State public var items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    @State private var showAlert = false
    @State private var selectedIndex: Int? = nil // 선택된 인덱스
 
    public  var body: some View {
        VStack {
             KHTextField(text: $name, 
                         placeHolder: "캠핑장의 이름은 어떻게 되나요?",
                         symboldIcon:Image(systemName: "pencil"))
            DatePicker("방문은 언제했나요?", selection: $visitDate)
            
            KHTextField(text: $name, 
                        placeHolder: "지역은 어디인가요?",
                        symboldIcon:Image(systemName: "mappin"))
            KHTextField(text: $name,
                        placeHolder: "시설은?",
                        symboldIcon:Image(systemName: "pencil"))
            
            HStack {
                Button(action: {}, label: {
                    Image(systemName: "photo.badge.plus.fill").foregroundStyle(.white).frame(width: 40,height: 140)
                }).background(KHColor.Primary.P10).clipShape(RoundedRectangle(cornerRadius: 8))
                
                ScrollView(.horizontal) {
                    HStack(spacing: 16) {
                        ForEach(items.indices, id: \.self) { index in
                            PhotoItemView(Photo: ResourcesAsset.panda.swiftUIImage) {
                                print("LEE")
                                selectedIndex = index
                                showAlert = true
                            }
                        }
                    }.alert("사진을 삭제할까요?", isPresented: $showAlert) {
                        
                        Button("삭제", role: .destructive) {
                            if let index = selectedIndex {
                                items.remove(at: index)
                            }
                        }
                        Button("취소", role: .cancel) {
                            
                        }
                    }
                    .padding()
                    
                }
                
            }
            
            Spacer()
            KHButton(title: "확인", action: {
                
            }, KHButtonStyle(background: KHColor.Primary.P00, 12)).foregroundColor(.white).frame(height: 50)
        }.padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}






#Preview {
    EditView()
}
