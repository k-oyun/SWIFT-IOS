
import SwiftUI

struct VoteListView: View {
//    let votes = ["첫 번째 투표", "두 번째 투표", "세 번째 투표"]
    @State private var votes = [
        Vote(title: "첫 번째 투표", options: ["옵션 1","옵션 2","옵션 3"]),
        Vote(title: "두 번째 투표", options: ["옵션 1","옵션 2","옵션 3"]),
    ]
    @State private var isPresentingCreate: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                ScrollView {
                    LazyVStack {
                        ForEach(votes) {vote in
                            NavigationLink(destination: VoteView(vote: vote)) {
                                VoteCardView(vote: vote)
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
            .navigationDestination(isPresented: $isPresentingCreate) {
                CreateVoteView() { vote in
                    votes.append(vote)
                }
            }
            //            .sheet(isPresented: $isPresentingCreate) {
            //                CreateVoteView()
            //            }
        }
        
    }
}

struct VoteCardView: View {
    let vote: Vote
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(vote.title)
                .font(.headline)
                .foregroundColor(.white)
            Text("투표 항목 보기")
                .font(.subheadline)
                .foregroundColor(.white)
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
