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
    
   
    public var body: some View {
        NavigationView(content: {
            VStack {
                if store.items.isEmpty {
                    ReadEmptyView()
                }
                else {
                    itemListView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Text("방문 장소")
                        .font(KHFont.title02)
                        .foregroundColor(KHColor.Primary.P00)
                }
                ToolbarItem {
                    itemAddButton()
                }
            }
        }).onAppear() {
            store.send(.didApear)
        }
        
    }
}



internal extension ReadView {
    
    func itemListView() -> some View {
        List(store.items, id: \.id) { item in
            ZStack {
                ReadItemView(item: item)
                NavigationLink {
                    EditView(store: Store(initialState: EditReducer.State(), reducer: {
                        EditReducer()
                    }))
                } label: {
                    EmptyView()
                }.opacity(0)
            }.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0))
            .listRowSeparator(.hidden)
            .listStyle(.plain)
            .listRowBackground(Color.clear)
        }
        .scrollContentBackground(.hidden)
        .listStyle(.plain)
    }
    
    func itemAddButton() -> some View {
        NavigationLink(destination: EditView(store: Store(initialState: EditReducer.State(), reducer: {
            EditReducer()
        }))) {
            Image(systemName: "plus.app")
                .resizable()
                .frame(width: 22, height: 22)
                .foregroundStyle(Color.blue) // 색상 변경
        }
        .frame(width: 44, height: 44)
    }
}

#Preview {
    ReadView(store: Store(initialState: ReadReducer.State()) {ReadReducer()})
}

