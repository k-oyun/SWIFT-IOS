//
//  ContentView6.swift
//  8StateManagement
//
//  Created by Admin on 8/19/25.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published var userName = "Guest"
}

struct ContentView6: View {
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        Text("사용자 : \(settings.userName)")
        Button("username 변경") {
            settings.userName = "오윤"
        }
    }
}

#Preview {
    ContentView6()
        .environmentObject(UserSettings())
}
