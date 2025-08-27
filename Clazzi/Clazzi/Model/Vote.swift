

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
    
    init(name: String) {
        self.name = name
    }
}
