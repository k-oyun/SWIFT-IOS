
import Foundation
import SwiftData

@Model
final class User {
    @Attribute(.unique) var id: UUID
    var email: String
    var password: String
    
    init(email: String, password: String) {
        self.id = UUID()
        self.email = email
        self.password = password
    }
}
