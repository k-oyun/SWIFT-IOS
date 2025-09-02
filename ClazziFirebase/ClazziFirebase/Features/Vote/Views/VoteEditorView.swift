
import SwiftUI

struct VoteEditorView: View {
    // 뒤로 가기(모달(바텀시트) 닫기)
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var session: UserSession
    
    @State private var title: String
    @State private var options: [String]
    
    // 투표 목록 화면에서 전달해줄 콜백 메서드
    var onSave: (Vote) -> Void
    
    private var vote: Vote? = nil
    
    // 토스트 메시지
    @State var toastMessage: String? = nil
    
    init(vote: Vote? = nil, onSave: @escaping (Vote) -> Void) {
        self.vote = vote
        self.onSave = onSave
        // 수정일 경우 초기값 설정
        self.title = vote?.title ?? ""
        self.options = vote?.options.map { $0.name } ?? ["", ""]
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    ScrollView {
                        VStack(alignment: .leading) {
                            TextField("투표 제목", text: $title)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                                .padding(.bottom, 32)
                            Text("투표 항목")
                                .font(.headline)
                            
                            ForEach(options.indices, id: \.self) { index in
                                HStack {
                                    TextField("항목 \(index + 1)", text: $options[index])
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.gray, lineWidth: 1)
                                        )
                                    Button(action: {
                                        options.remove(at: index)
                                    }) {
                                        Image(systemName: "xmark")
                                    }
                                    .foregroundColor(.gray)
                                }
                                .padding(.bottom, 8)
                            }
                            
                            Button("항목 추가") {
                                options.append("")
                            }
                            .buttonStyle(.bordered)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            Spacer()
                        }
                        .padding()
                        
                    }
                    .navigationTitle(Text(vote == nil ? "투표 생성 화면" : "투표 수정 화면"))
                    
                    // 생성, 수정하기 버튼
                    Button(action: {
                        /// 투표 제목 검사
                        // 타이틀 앞뒤 공백 (개행문자 포함) 제거
                        let title = title.trimmingCharacters(in: .whitespacesAndNewlines)
                        guard !title.isEmpty else {
                            toastMessage = "제목을 정확히 입력해주세요."
                            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                                withAnimation {
                                    toastMessage = nil
                                }
                            }
                            return
                        }
                        
                        /// 투표 항목 검사
                        let options = options.map { option in
                            option.trimmingCharacters(in: .whitespacesAndNewlines)
                        }.filter { !$0.isEmpty }
                        
                        guard options.count >= 2 else {
                            toastMessage = "최소 2개 이상의 항목을 입력해주세요."
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    toastMessage = nil
                                }
                            }
                            return
                        }
                        
                        if var vote = vote { // 투표 수정
                            vote.title = title
                            vote.options = options.map { VoteOption(name: $0) }
                            onSave(vote)
                        } else { // 투표 생성
                            let newVote = Vote(title: title, createdBy: session.user?.uid ?? ""
                                               , options: options.map { VoteOption(name: $0) })
                            onSave(newVote)
                        }
                        
                        dismiss()
                    }) {
                        Text(vote == nil ? "생성하기" : "수정하기")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }
                
                if let toastMessage = toastMessage {
                    ToastView(message: toastMessage)
                }
            }
            
        }
    }
}

//#Preview("투표 생성") {
//    VoteEditorView() { _ in }
//}

//#Preview("투표 수정") {
//    // 샘플 투표 생성
//    let sampleVote = Vote(title: "샘플 투표", options: [
//        VoteOption(name: "옵션 1"),
//        VoteOption(name: "옵션 2")
//    ])
//    // 뷰에 샘플 투표 전달
//    VoteEditorView(vote: sampleVote) { _ in }
//}
