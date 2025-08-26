//
//  BluetoothView.swift
//  Settings
//
//  Created by Admin on 8/26/25.
//

import SwiftUI

struct BluetoothView: View {
    @State private var isOn = false
    @State private var isSearching = true
    var body: some View {
        NavigationStack {
            List {
                Section (footer: Text("이 iPhone은 Bluetooth 설정이 열려 있는 동안 'iPhone'(으)로 인식 가능합니다.")) {
                    HStack {
                        Text("Bluetooth")
                        Spacer()
                        Toggle("On", isOn: $isOn)
                            .labelsHidden()
                    }
                }
                
                Section(header: Text("나의 기기")) {
                    HStack {
                        Text("헤드폰 1")
                        Spacer()
                        Text("연결 안 됨")
                            .foregroundColor(.gray)
                        Image(systemName: "info.circle")
                            .resizable()
                            .frame(width: 26, height: 26)
                            .foregroundColor(.blue)
                    }
                }
                
                Section(header: HStack {
                    Text("기타 기기")
                    if isSearching {
                        ProgressView()
                            .onTapGesture {
                                isSearching.toggle()
                            }
                    }
                }) {
                    Text("기기1")
                    Text("기기2")
                    Text("기기3")
                    Text("기기4")
                    Text("기기5")
                }
            }
            .navigationBarTitle("Bluetooth")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    BluetoothView()
}
