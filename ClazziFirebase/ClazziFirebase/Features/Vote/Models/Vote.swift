
import Foundation
import FirebaseFirestore

// Codable: 제이슨 데이터를 스위프트 모델로 자동 변환할 때 사용하는 프로토콜
struct Vote: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var createdBy: String
    var createdAt: Date
    var options: [VoteOption]
    var imageURL: String?

    init(title: String, createdBy: String, options: [VoteOption] = [], imageURL: String? = nil) {
        self.id = nil
        self.title = title
        self.options = options
        self.createdBy = createdBy
        self.createdAt = Date()
        self.imageURL = imageURL
    }
}


struct VoteOption: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var voters: [String] = [] // 여기에 투표자 ID 저장

    init(name: String, voters: [String] = []) {
        self.id = nil
        self.name = name
        self.voters = voters
    }
    
   
}
