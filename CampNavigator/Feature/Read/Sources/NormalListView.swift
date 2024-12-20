import SwiftUI
import KHDesignSystem
import ComposableArchitecture
import Resources
import Lottie
import Edit
import SwiftData

public struct NormalListView: View {
    
    public init(store: StoreOf<NormalListFeature>) {
        self.store = store
        
    }
    
    @Bindable var store:StoreOf<NormalListFeature>
     
   
    public var body: some View {
        NavigationView(content: {
            VStack {
                if store.items.isEmpty {
                    ListEmptyView()
                }
                else {
                    itemListView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Text("방문 장소")
                        .font(KHFont.Headline.H02)
                        .foregroundColor(KHColor.Primary.P00)
                }
                ToolbarItem {
                    
                    Button {
                        store.send(.setAddView(isPresented: true))
                    } label: {
                        Image(systemName: "plus.square.fill.on.square.fill")
                            .resizable()
                            .frame(width: 28, height: 28)
                    }
                    .frame(width: 44, height: 44)

                   
                }
            }
        }).onAppear() {
            store.send(.didApear)
        }
        .sheet(isPresented: $store.isShowAddView.sending(\.setAddView), content: {
            EditView(store: Store(initialState: EditFeature.State(), reducer: {
                EditFeature()
            }))
        })
        .confirmationDialog($store.scope(state: \.confirmationDialog, action: \.confirmationDialog))
        
    }
}



internal extension NormalListView {
    
    func itemListView() -> some View {
        List(store.items, id: \.id) { item in
            ReadItemView(item: item)
                .onLongPressGesture(perform: {
                UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                store.send(.confirmationDialogButtonTapped(item))
            })
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
            .listRowSeparator(.hidden)
            .listStyle(.plain)
            .listRowBackground(Color.clear)
        }
        .background(KHColor.Gray.GR10)
        .scrollContentBackground(.hidden)
        .listStyle(.plain)
    }
}

#Preview {
    NormalListView(store: Store(initialState: NormalListFeature.State()) {NormalListFeature()})
}

