//
//  ContentView3.swift
//  6Navigation
//
//  Created by Admin on 8/19/25.
//

import SwiftUI

struct ContentView3: View {
    @State private var showSheet = false
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding(.bottom, 100)
        Button("모달 열기") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            ModalView()        }
    }
}


struct ModalView: View {
    @Environment(\.dismiss) var dismiss
        
    var body: some View {
        Text("이것은 모달화면입니다.")
        Button("닫기") {
            dismiss()
        }
    }
}

#Preview {
    ContentView3()
}
