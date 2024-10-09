//
//  FacilitieView.swift
//  Edit
//
//  Created by LEE on 10/9/24.
//  Copyright © 2024 LEE. All rights reserved.
//

import SwiftUI

struct FacilitieView: View {
    
    @State var bgColor:Color = .red
    @State var text:String = ""
    var body: some View {
        
        VStack {
            TextField("입력해 주세요", text: $text)
                        .padding()
                        .background(bgColor)
                        .clipShape(Capsule())
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
            ColorPicker("배경 컬러를 선택해주세요", selection: $bgColor)
            Spacer()
            Button {
                
            } label: {
                Text("추가하기").foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .background(.blue)
            .cornerRadius(8)
            
                
        }.padding()
   
        
        

        
    }
}

#Preview {
    FacilitieView()
}
