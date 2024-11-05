import Foundation
import Combine

class BookViewModel: ObservableObject {
    
    @Published
    var allBooks: [Book] = []
    
    private let apiManager = ApiManager()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscriptions()
    }
    
    private func setupSubscriptions() {
        apiManager.$allBooks
            .sink { [weak self] books in
                self?.allBooks = books
            }
            .store(in: &cancellables)
    }
}
