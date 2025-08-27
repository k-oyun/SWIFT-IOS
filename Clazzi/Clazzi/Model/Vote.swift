

import Foundation
import SwiftData

@Model
class Vote: Identifiable {
    var id = UUID()
    var title: String
    var options: [String]
    
    init(title: String, options: [String]) {
        self.title = title
        self.options = options
    }
}
