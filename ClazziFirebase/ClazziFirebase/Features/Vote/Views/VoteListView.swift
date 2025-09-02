

import SwiftUI
import FirebaseAuth

struct VoteListView: View {
    @EnvironmentObject var session: UserSession
    // 뷰모델: ObservableObject -> 초기화 "@StateObject" 뷰모델
    @StateObject private var voteViewModel = VoteViewModel()
    
    
    // 투표 삭제 관련
    @State private var showDeleteAlert = false
    @State private var voteToDelete: Vote? = nil
    
    // 투표 수정 관련
    @State private var isPresentingEdit = false
    @State private var voteToEdit: Vote? = nil
    
    var body: some View {
        // 아이패드 대응 네비게이션: NavigationSplitView
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(voteViewModel.votes) { vote in
                        NavigationLink(destination: VoteView(vote: vote) { vote in
                            Task{ await voteViewModel.updateVote(vote)}
                        }) {
                            VoteCardView(vote: vote) {
                                voteToDelete = vote
                                showDeleteAlert = true
                            } onEdit: {
                                voteToEdit = vote
                                isPresentingEdit = true
                            }
                        }
                    }
                }
            }
            .padding()
            .navigationBarTitle("투표 목록 화면")
            .toolbar {
                // 투표 생성
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: VoteEditorView { newVote, selectedImage in
                        Task {
                            await voteViewModel.createVote(newVote, image: selectedImage)
                        }
                        
                    }) {
                        Image(systemName: "plus")
                    }
                }
                
            }
            // 수정화면 띄우기
            .navigationDestination(isPresented: $isPresentingEdit) {
                if let vote = voteToEdit {
                    VoteEditorView(vote: vote) { updatedVote, selectedImage in
                        Task{await voteViewModel.updateVote(updatedVote)}
                    }
                }
            }
            // 삭제 알러트
            .alert("투표를 삭제하시겠습니까?", isPresented: $showDeleteAlert) {
                Button("삭제", role: .destructive) {
                    if let vote = voteToDelete {
                        voteViewModel.deleteVote(vote)
                        voteToDelete = nil
                    }
                }
                Button("취소", role: .cancel) {
                    voteToDelete = nil // 취소 시 상태 초기화
                }
            } message: {
                if let vote = voteToDelete {
                    Text("'\(vote.title)' 투표가 삭제됩니다.")
                }
            }
        }
    }
}

struct VoteCardView: View {
    let vote: Vote
    let onDelete: () -> Void
    let onEdit: () -> Void
    @EnvironmentObject var session: UserSession
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(vote.title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text("투표 항목 보기")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            Spacer()
            if let user = session.user, vote.createdBy == user.uid {
                Button(action: {
                    onEdit()
                }) {
                    Image(systemName: "pencil")
                        .foregroundStyle(.white)
                }
                Button(action: {
                    onDelete()
                }) {
                    Image(systemName: "trash")
                        .foregroundStyle(.white)
                }
            }
            
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.blue)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}
