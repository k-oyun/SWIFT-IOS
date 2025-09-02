//
//  ToastView.swift
//  Clazzi
//
//  Created by Kihwan Jo on 8/30/25.
//

import SwiftUI

enum ToastPosition {
    case top, middle, bottom
}

// 커스텀 뷰 만드는 이유: 재사용성
struct ToastView: View {
    let message: String
    var position: ToastPosition = .bottom   // 기본값 bottom
    var body: some View {
        VStack {
            if position != .top {
                Spacer()
            }
            
            Text(message)
                .padding(12)
                .background(Color.black.opacity(0.5))
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.vertical, 64)
            
            if position != .bottom {
                Spacer()
            }
        }
    }
}

#Preview {
    ToastView(message: "토스트 메세지", position: .middle)
}
