
import SwiftUI
import SwiftData
struct VoteListView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \Vote.title, order: .forward) private var votes: [Vote]
//    
//    @State private var votes = [
//        Vote(title: "첫 번째 투표", options: ["옵션 1","옵션 2","옵션 3"]),
//        Vote(title: "두 번째 투표", options: ["옵션 1","옵션 2","옵션 3"]),
//    ]
    
    // 투표 생성 화면
    @State private var isPresentingCreate: Bool = false
    // 투표 수정 관련
    @State private var isPresentingEdit = false
    
    // 투표 삭제 관련
    @State private var showDeleteAlert = false
    @State private var voteToDelete: Vote? = nil
    
    //투표 수정 관련
    @State private var voteToEdit: Vote? = nil
    @State private var editIndex: Int? = nil
    
    var body: some View {
        NavigationStack {
            // 리스트로 요소 삭제하는 방법
//            List {
//                ForEach(votes.indices, id: \.self) {index in
//                    let vote = votes[index]
//                    NavigationLink(destination: VoteView(vote: vote)) {
//                        VoteCardView(vote: vot
    
//                    }
//                }
//                .onDelete { indexSet in
//                    votes.remove(atOffsets: indexSet)
//
//                }
//            }
//            .listStyle(.sidebar)
            ZStack{
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(votes.indices, id: \.self) {index in
                            let vote = votes[index]
                            NavigationLink(destination: VoteView(vote: vote)) {
                                VoteCardView(vote: vote) {
                                    voteToDelete = vote
                                    showDeleteAlert = true
//                                    votes.remove(at: index)
                                } onEdit: {
                                    voteToEdit = vote
                                    editIndex = index
                                    isPresentingEdit = true
                                }
                            }
                        }
                        
                    }
                }
                
                VStack {
                    Spacer()
                    HStack{
                        Spacer()
                        Button(action: {
                            isPresentingCreate = true
                        }) {
                            Image(systemName:"plus")
                                .foregroundColor(.white)
                                .padding()
                                .background(.blue)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                        .padding()
                    }
                }
            }
            .padding()
            .navigationTitle(Text("투표 목록 화면"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    // 화면 이동 방법1: 툴바 네비게이션 링크
                    //                    NavigationLink(destination: CreateVoteView()) {
                    //                        Image(systemName: "plus")
                    //                    }
                    // 화면 이동 방법2: 상태를 이용한 이동 방법
                    Button(action: {
                        isPresentingCreate = true
                    }
                    ) {
                        Image(systemName: "plus")
                    }
                }
            }
            // 화면 이동 방법2
            .navigationDestination(isPresented: $isPresentingCreate) {
                CreateVoteView() { vote in
//                    votes.append(vote)
                    
                    modelContext.insert(vote)
                    do {
                        try modelContext.save()
                    } catch {
                        print("저장 실패: \(error)")
                    }
                    
                }
            }
            // 수정화면 띄우기
            .navigationDestination(isPresented: $isPresentingEdit) {
                if let vote = voteToEdit, let index = editIndex {
                    CreateVoteView(vote: vote) { updatedVote in
//                        votes[index] = updatedVote
                        do {
                            try modelContext.save()
                        } catch{
                            print("수정 실패 \(error)")
                        }
                    }
                }
            }
            // 모달(바텀 시트)를 활용한 화면 띄우는 방법(상태 이용)
            //            .sheet(isPresented: $isPresentingCreate) {
            //                CreateVoteView()
            //            }
            
            // 삭제 알러트
            .alert("투표를 삭제하시겠습니까?", isPresented: $showDeleteAlert) {
                Button("삭제", role: .destructive) {
//                    let a: Int? = votes.firstIndex(where: { $0.id == voteToDelete!.id})
                    
                    if let target = voteToDelete, let index = votes.firstIndex(where: { $0.id == target.id }) {
//                        votes.remove(at: index)
                        modelContext.delete(target)
                        do {
                            try modelContext.save()
                        } catch{
                            print("삭제 실패 \(error)")
                        }
                    }
                }
                Button("취소", role: .cancel) {}
            } message: {
                if let target = voteToDelete {
                    Text("'\(target.title)' 투표가 삭제됩니다.")
                }
            }
        }
    }
}

struct VoteCardView: View {
    let vote: Vote
    let onDelete:() -> Void
    let onEdit:() -> Void
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
//            Button(action: onDelete) {
//                Image(systemName: "trash")
//                    .foregroundStyle(.white)
//            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.gray)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.2),radius: 4, x: 0, y: 2)
        
    }
}

#Preview {
    VoteListView()
}
