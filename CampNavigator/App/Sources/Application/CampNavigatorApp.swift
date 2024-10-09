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
                ReadView(store: Store(initialState: ReadFeature.State()) {ReadFeature()}).modelContainer(CampModelContainer.modelContainer)
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
