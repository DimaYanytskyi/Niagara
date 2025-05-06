import Foundation

class NavigationViewModel : ObservableObject {
    static let shared = NavigationViewModel()
    
    @Published var navigations: [Navigations] = []
    @Published var web: Bool = false
    @Published var url: URL? = nil
    
    init() {
        navigate(to: .splash)
    }
    
    func navigate(to: Navigations) {
        navigations.append(to)
    }
    
    func navigate(to: String) {
        if let url = URL(string: to) {
            self.url = url
            web = true
        }
    }
    
    func back() {
        navigations.removeLast()
    }
}

