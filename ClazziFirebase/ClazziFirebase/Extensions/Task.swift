import Foundation

extension Task where Success == Never, Failure == Never {
    // 초 단위로 Task.sleep
    static func sleep(seconds: UInt64) async throws {
        try await Task.sleep(nanoseconds: .init(seconds * 1_000_000_000))
    }
}
