
import Foundation
import FirebaseAuth


class UserSession: ObservableObject {
    
    @Published var user: User?
    private var handle: AuthStateDidChangeListenerHandle?
    
    init() {
        self.user = Auth.auth().currentUser
        handle = Auth.auth().addStateDidChangeListener { _, user in
            self.user = user
        }
    }
}
