//
//  IntroView.swift
//  ClazziFirebase
//
//  Created by Admin on 9/1/25.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            Image("chu")
                .resizable()              // 크기 조정 가능하게
                .scaledToFit()            // 화면에 맞게 비율 유지하며 축소/확대
                .frame(maxWidth: .infinity, maxHeight: .infinity) // 부모 뷰에 맞춤
        }
    }
}

#Preview {
    IntroView()
}
