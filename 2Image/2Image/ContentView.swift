//
//  ContentView.swift
//  2Image
//
//  Created by oyun on 2025-08-18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // 시스템 이미지 사용
            
            Image(systemName: "globe") // SF Symbol 이름 : globe
                .imageScale(.large)
                .foregroundStyle(.tint)
            Image(systemName: "globe")
                .font(.system(size:32))
                .foregroundStyle(.yellow)
            
            // 에셋 이미지
            Image("dongjin")
                .resizable() // 이렇게 해야만 크기 조절이 가능하게 된다.
                .scaledToFit() // 비율 유지하며 프레임 안에 맞춤
                .frame(width: 200,height: 100)
                .background(Color.gray)
            Image("dongjin")
                .resizable() // 이렇게 해야만 크기 조절이 가능하게 된다.
                .scaledToFill() // 비율 유지하며 프레임 안에 맞춤
                .frame(width: 200,height: 100)
                .background(Color.gray)
                .clipped() // 프레임 밖으로 나가는 부분 자르기
            Image("dongjin")
                .resizable()
                .frame(width: 200,height: 200)
        }
        
        .padding()
    }
}

#Preview {
    ContentView()
}
