import SwiftUI
import KHDesignSystem
import ComposableArchitecture
import Resources
import Lottie
import Edit

public struct ReadView: View {
    


    public init(store: StoreOf<ReadReducer>) {
        self.store = store
    }
    
    let store:StoreOf<ReadReducer>
    
    public let items:[String] =  ["", "", "", ""]
    public var body: some View {
        
        NavigationView {
                    VStack {
                        if items.isEmpty {
                            
                            Text("방문한곳이 없네요")
                                .font(KHFont.subTitle02)
                                .foregroundStyle(KHColor.Gray.GR90)
                                .frame(maxHeight: .infinity)
                            
                        }
                        else {
                            List(items, id: \.self) { item in
                                ReadItemView(item: "item")
                                    .listRowSeparator(.hidden)
                            }
                            .listStyle(.plain)
                            .scrollContentBackground(.hidden)
                        }
                        
                       
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigation) {
                            Text("방문 장소")
                                .font(KHFont.title02) // 원하는 폰트와 크기로 변경
                                .foregroundColor(KHColor.Primary.P00)
                        }
                        ToolbarItem {
                            Button {
                                
                            } label: {
                                Image(systemName: "plus.app")
                                    .resizable()
                                    .frame(width: 22, height: 22)
                                    .foregroundStyle(KHColor.Primary.P00)
                                    
                            }.frame(width: 44, height: 44)
                        }
                    }
                }
        


        
        
        
        
        
        
//        NavigationView(content: {
//            NavigationLink(destination: EditView(store: Store(initialState: EditReducer.State(), reducer: {
//                EditReducer()
//            }))) {
//
//            }.navigationBarTitleDisplayMode(.inline) // 타이틀을 인라인 모드로 설정
//                .toolbar {
//                    ToolbarItem(placement: .principal) {
//                        VStack {
//                            Text("List")
//                                .font(KHFont.custom(.Bold, size: 18))
//                        }
//                    }
//                }
//        })
        
        
    }
}

#Preview {
    ReadView(store: Store(initialState: ReadReducer.State()) {ReadReducer()})
}
 
