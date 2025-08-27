//
//  ContentView.swift
//  Clazzi
//
//  Created by Admin on 8/26/25.
//

import SwiftUI

struct VoteView: View {
    
    // 뒤로 가기
    @Environment(\.dismiss ) private var dismiss
    
    @State private var selectedOption: Int? = nil
    
    let vote: Vote
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                
                Text(vote.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                
                ForEach(vote.options.indices, id: \.self) { option in
                    Button(action: {
                        selectedOption = option
                    }) {
                        Text(vote.options[option])
                            .frame(maxWidth: 200)
                            .padding()
                            .background(selectedOption == option ? Color.green : Color.gray.opacity(0.2))
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                }
                
                Spacer()
                
                // 투표하기
                Button(action: {
                    print("투표 항목은 \(vote.options[selectedOption ?? 0])")
                    dismiss()
                }) {
                    Text("투표하기")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                }
            }
            .padding()
            .navigationTitle(Text("투표 화면"))
        }
    }
}

#Preview {
    VoteView(vote: Vote(title: "첫 번째 투표", options: ["옵션 1","옵션 2","옵션 3"]))
}
