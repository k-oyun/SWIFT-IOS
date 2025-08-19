//
//  ContentView.swift
//  8StateManagement
//
//  Created by Admin on 8/19/25.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0 // 뷰 내부에서만 사용 가능
    var body: some View {
        VStack {
            Text("Count: \(count)")
            Button("증가") {
                count += 1
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
