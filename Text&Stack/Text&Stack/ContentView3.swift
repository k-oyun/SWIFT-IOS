//
//  ContentView3.swift
//  Text&Stack
//
//  Created by oyun on 2025-08-18.
//

import SwiftUI

struct ContentView3: View {
    var body: some View {
        VStack(spacing: 0) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .background(Color.red)
            Color.blue
                .frame(width: 100, height: 100) // 명시적으로 크기 지정
        }
    }
}

#Preview {
    ContentView3()
}
