import SwiftUI
import KHDesignSystem

public struct ContentView: View {
    public init() {}

    public var body: some View {
        VStack {
            Button("버튼입니다") {
                
            }.applyFont(.subTitle01).foregroundStyle(KHColor.Red.RD10)
            Text("안녕하세요\n반갑습니다.").applyFont(.display01).foregroundStyle(KHColor.Primary.P00)
        }
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
