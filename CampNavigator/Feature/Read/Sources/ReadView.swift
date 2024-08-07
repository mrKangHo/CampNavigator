import SwiftUI
import Edit
import KHDesignSystem
import Domain
import SwiftData
import ComposableArchitecture

public struct ReadView: View {
    
    public var name:String
    
    public init(name: String) {
        self.name = name
    }
    
    public var body: some View {
        Text("Hello")
    }
}
 

#Preview {
    ReadView(name: "")
}
