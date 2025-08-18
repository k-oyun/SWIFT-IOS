import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("텍스트1")
        Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
            .font(.title)
        Text("Placeholder2")
            .font(.system(size: 24))
        Text("안녕하세요.")
            .font(.body)
    }
}

#Preview {
    ContentView()
}
