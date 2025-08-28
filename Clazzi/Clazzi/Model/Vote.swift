

import Foundation
import SwiftData

@Model
final class Vote: Identifiable {
    var id: UUID
    var title: String
    @Relationship(deleteRule: .cascade)
    var options: [VoteOption]
    
    init(title: String, options: [VoteOption] = []) {
        self.id = UUID()
        self.title = title
        self.options = options
    }
}


@Model
class VoteOption {
    var name: String
    var voters: [UUID]  = [] // 여기에 투표자 ID저장
    init(name: String) {
        self.name = name
    }
    
    // 해당 투표 항목에 투표자가 몇 명 있는지?
    var votes: Int {
        voters.count
    }
    
    // 로그인한 유저가 이미 투표했는지
    func hasVoted(userID: UUID) -> Bool {
        voters.contains(userID)
    }
}
