import Foundation
import Combine

class CharacterViewModel: ObservableObject {
    
    @Published
    var allCharacters: [Character] = []
    
    private let apiManager = ApiManager()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscriptions()
    }
    
    private func setupSubscriptions() {
        apiManager.$allCharacters
            .sink { [weak self] characters in
                self?.allCharacters = characters
            }
            .store(in: &cancellables)
    }
    
}
