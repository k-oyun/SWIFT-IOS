

import Foundation

struct Vote: Identifiable {
    var id = UUID()
    let title: String
    let options: [String]
}
