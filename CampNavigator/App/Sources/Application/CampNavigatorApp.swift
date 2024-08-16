import SwiftUI
import Intro
import KHDesignSystem
import SwiftData
import Domain

@main
struct CampNavigatorApp: App {
    
    var modelContainer: ModelContainer = {
        let schema = Schema([CampPlace.self, CampFacility.self, CampLocation.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
 
    
    init() {
        KHFont.loadFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            IntroView().modelContainer(modelContainer)
        }
    }
}
#Preview {
    IntroView()
}
