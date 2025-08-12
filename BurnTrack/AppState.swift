import SwiftUI
import Combine

final class AppState: ObservableObject {
    @Published var isAuthenticated: Bool = AuthStore.shared.isLoggedIn
}
