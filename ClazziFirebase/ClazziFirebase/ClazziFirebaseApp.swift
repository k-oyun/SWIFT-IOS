
import SwiftUI
import FirebaseCore
import FirebaseAuth

@main
struct ClazziFirebaseApp: App {
    // 로그인 상태
    @StateObject var session = UserSession()
    
    @State private var isLoading = true
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            Group {
                if isLoading{
                    IntroView()
                } else if session.user == nil {
                    AuthView()
                } else {
                    MainView()
                }
            }
            .onAppear {
                Task {
                    try await Task.sleep(seconds: 2)
                    isLoading = false
                }
            }
            .environmentObject(session) // 전역으로 사용자 세션을 이용할 수 있게
        }
    }
}
