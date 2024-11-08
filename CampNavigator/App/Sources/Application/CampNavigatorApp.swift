import SwiftUI
import Intro
import KHDesignSystem
import Domain
import Read
import ComposableArchitecture

@main
struct CampNavigatorApp: App {
    @AppStorage("hasRunHistgory") private var hasRunHistgory: Bool = false
    init() {
        KHFont.loadFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            if hasRunHistgory {
                TabView {
                    NormalListView(store: Store(initialState: NormalListFeature.State()) {NormalListFeature()}).modelContainer(CampModelContainer.modelContainer)
                        .tabItem {
                        Image(systemName: "list.bullet.below.rectangle")
                        Text("목록")
                    }
                    .tag(0)
                    MapListView(store: Store(initialState: MapListFeature.State()) {MapListFeature()}).modelContainer(CampModelContainer.modelContainer).tabItem {
                        Image(systemName: "map")
                        Text("지도")
                    }.tag(1)
                }
            }
            else {
                IntroView().modelContainer(CampModelContainer.modelContainer)
            }
            
        }
    }
}
#Preview {
    IntroView()
}
