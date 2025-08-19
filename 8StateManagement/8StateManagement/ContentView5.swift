//
//  ContentView5.swift
//  8StateManagement
//
//  Created by Admin on 8/19/25.
//

import SwiftUI

class CounterModel2: ObservableObject {
    @Published var count: Int = 0
}

struct ChildView1: View {
    // Observed는 binding하고 비슷함
    @ObservedObject var counterModel : CounterModel2
    // Binding // 단순 값을 받을때
    
    var body: some View {
        Button("증가") {
            counterModel.count += 1
        }
    }
}

struct ChildView2: View {
    // Observed는 binding하고 비슷함
    @ObservedObject var counterModel : CounterModel2
    // Binding // 단순 값을 받을때
    
    var body: some View {
        Button("증가") {
            counterModel.count += 1
        }
    }
}
struct ContentView5: View {
    @StateObject var counterModel = CounterModel2()
    
    var body: some View {
        VStack {
            Text("카운트 \(counterModel.count)")
            ChildView1(counterModel: counterModel)
            ChildView2(counterModel: counterModel)
        }
    }
}

#Preview {
    ContentView5()
}
