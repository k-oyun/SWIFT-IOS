//
//  ContentView.swift
//  Clazzi
//
//  Created by Admin on 8/26/25.
//

import SwiftUI

struct VoteView: View {
    // 뒤로 가기
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedOption: Int = 0
    
    @Bindable var vote: Vote
    
    @Binding var currentUserID: UUID?
    
    // 현재 유저가 이미 투표 했는지
    private var hasVoted: Bool {
        vote.options.contains(where: { $0.voters.contains(currentUserID ?? UUID()) })
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text(vote.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                ForEach(vote.options.indices, id: \.self) { index in
                    Button(action: {
                        selectedOption = index
                    }) {
                        HStack {
                            Text(vote.options[index].name)
                            Spacer()
                            Text("\(vote.options[index].votes)")
                        }
                        .padding(.horizontal, 20)
                        .frame(maxWidth: 200)
                        .padding()
                        .background(index == selectedOption ? Color.green : Color.gray.opacity(0.5))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    }
                    .disabled(hasVoted)
                }
               
                Spacer()
                
                // 투표하기
                Button(action: {
                    print("투표 항목은 \(vote.options[selectedOption])입니다.")
                    if let currentUserID = currentUserID {
                        vote.options[selectedOption].voters.append(currentUserID)
                    }
                }) {
                    Text("투표하기")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                }
                .disabled(hasVoted)
            }
            .padding()
            .navigationTitle(Text("투표 화면"))
        }
    }
}

#Preview {
    @Previewable @State var currentUserID: UUID? = nil
    VoteView(vote: Vote(title: "첫 번째 투표", options: [
        VoteOption(name:"옵션 1"),
        VoteOption(name:"옵션 2")
    ]), currentUserID: $currentUserID)
}
