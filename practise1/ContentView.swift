import SwiftUI
import Playgrounds

struct ContentView: View {
    var body: some View {
        Rectangle()
            .frame(width: 300, height: 300)
            .foregroundStyle(Color.gray)
            .background(Color.yellow)
    }
}

#Preview {
    ContentView()
}

#Playground {
    _ = 1 + 2
}
