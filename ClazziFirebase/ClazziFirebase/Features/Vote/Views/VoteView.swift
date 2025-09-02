
import SwiftUI
import SwiftData

struct VoteView: View {
    @EnvironmentObject var session: UserSession
    // 뒤로 가기
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedOption: Int = 0
    
    @State var vote: Vote
    
    
    // 현재 유저가 이미 투표했는지 확인
    private var hasVoted: Bool {
        guard let user = session.user else { return false } // 현재 유저가 nil인지 아닌지 (로그인했는지 안했는지)
        return vote.options.contains { $0.voters.contains(user.uid) }
        // 내 아이디가 있는지 있으면 true 반환 -> 여러 옵션들이 $0으로 들어가서 순회 함
        // option1-> voters
        // option2-> voters
        // option3-> voters
        // 투표 옵션 중 하나라도 사용자 ID가 들어 있으면 true 반환
    }
    
    // 토스트 메세지
    @State private var toastMessage: String? = nil
    
    var onVote: (Vote) -> Void
    
    var body: some View {
        NavigationStack {
            ZStack {
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
                                
                                // 이미 투표한 경우 표시
                                if let user = session.user,
                                   vote.options[index].voters.contains(user.uid) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.white)
                                }
                                
                                Text("\(vote.options[index].voters.count)")
                            }
                            .padding(.horizontal)
                            .frame(maxWidth: 200)
                            .padding()
                            .background(index == selectedOption ? Color.green : Color.gray.opacity(0.5))
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                        }
                        
                    }
                    
                    Spacer()
                    
                    // 투표하기
                    Button(action: {
                        guard let user = session.user, !hasVoted else {
                            // 토스트 노출
                            toastMessage = "이미 투표했거나 유저 ID가 없습니다."
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    toastMessage = nil
                                }
                            }
                            
                            return
                        }
                        
                        // 투표 데이터 업데이트
//                        var vote = self.vote
                        vote.options[selectedOption].voters.append(user.uid)
                        onVote(vote)
                    }) {
                        Text("투표하기")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(hasVoted ? .gray : Color.blue)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                                    .disabled(hasVoted)
                }
                
                if let toastMessage = toastMessage {
                    ToastView(message: toastMessage)
                }
            }
            .padding()
            .navigationTitle(Text("투표 화면"))
        }
    }
}

//#Preview {
//    // 가짜 사용자 로그인 상태
//    @Previewable @State var currentUserID: UUID? = UUID()
//
//    // 1. 프리뷰 전용 inMemory 컨테이너 생성
//    let container = try! ModelContainer(
//        for: Vote.self, VoteOption.self,
//        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
//    )
//    // 2. 샘플 투표 생성
//    let sampleVote = Vote(title: "샘플 투표", options: [
//        VoteOption(name: "옵션 1"),
//        VoteOption(name: "옵션 2")
//    ])
//    // 3. 샘플 투표 삽입
//    container.mainContext.insert(sampleVote)
//    // 4. 뷰에 컨테이너 주입
//    return VoteView(vote: sampleVote, currentUserID: $currentUserID)
//        .modelContainer(container)
//}
