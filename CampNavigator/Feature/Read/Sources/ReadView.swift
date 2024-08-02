import SwiftUI
import Edit
import KHDesignSystem
import Domain
import SwiftData

public struct ReadView: View {
    
    public init() {}
    
    @Query var items:[CampPlace]
    
    public var body: some View {
        NavigationView(content: {
            NavigationLink(destination: EditView()) {
                ZStack {
                    // 배경 색상
                    LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.5), Color.red.opacity(0.3)]),
                                   startPoint: .topTrailing, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                    
                    
                    List(items, id: \.self) { item in
                        ReadItemView(item: "item")
                            .frame(height: 150)
                            .cornerRadius(10)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0))
                            .listRowBackground(Color.clear)
                    }
                    .padding(10)
                    .listStyle(.inset).scrollContentBackground(.hidden)
                    
                    
                }
            }.navigationBarTitleDisplayMode(.inline) // 타이틀을 인라인 모드로 설정
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text("List")
                                .font(KHFont.custom(.Bold, size: 18))
                        }
                    }
                }
        })
        
        
    }
}

#Preview {
    ReadView()
}
