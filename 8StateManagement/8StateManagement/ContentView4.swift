//
//  ContentView4.swift
//  8StateManagement
//
//  Created by Admin on 8/19/25.
//

import SwiftUI

class CounterModel: ObservableObject {
     @Published var count: Int = 0
}

struct ContentView4: View {
    @StateObject var counter = CounterModel()
    var body: some View {
        View1().background(Color.red)
        
    }
}


struct View1: View {
    @StateObject var counter = CounterModel()
    var body: some View {
        Text("카운트 : \(counter.count)")
        Button("증가") {
            counter.count += 1
        }
    }
}


#Preview {
    ContentView4()
}

