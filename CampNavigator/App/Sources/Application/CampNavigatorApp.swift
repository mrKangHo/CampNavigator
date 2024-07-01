import SwiftUI
import Intro
import KHDesignSystem


@main
struct CampNavigatorApp: App {
    
    init() {
        KHFont.loadFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            IntroView()
        }
    }
}
#Preview {
    IntroView()
}
