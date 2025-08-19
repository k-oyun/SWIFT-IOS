//
//  _StateManagementApp.swift
//  8StateManagement
//
//  Created by Admin on 8/19/25.
//

import SwiftUI

@main
struct _StateManagementApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserSettings()) // 전역으로 상태
        }
    }
}
