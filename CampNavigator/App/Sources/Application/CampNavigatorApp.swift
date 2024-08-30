import SwiftUI
import Intro
import KHDesignSystem
import Domain

@main
struct CampNavigatorApp: App {

    init() {
        KHFont.loadFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            IntroView().modelContainer(CampModelContainer.modelContainer)
        }
    }
}
#Preview {
    IntroView()
}
