import Foundation
import SwiftUI

class ApiManager: ObservableObject {
    
    enum ApiError: LocalizedError {
        case invalidURL
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .invalidURL: return "Invalid URL."
            case .unknown: return "Unknown error occurred."
            }
        }
    }
    
    @Published
    var allBooks: [Book] = []
    
    @Published
    var allCharacters: [Character] = []
    
    init() {
        Task {
            await fetchBooks()
            await fetchCharacters()
        }
    }
}

private extension ApiManager {
    
    func fetchBooks() async {
        guard let url = URL(string: "https://potterapi-fedeperin.vercel.app/en/books") else {
            print(ApiError.invalidURL.errorDescription ?? "Invalid URL error")
            return
        }
        
        do {
            let data = try await fetchData(from: url)
            let books = try JSONDecoder().decode([Book].self, from: data)
            DispatchQueue.main.async {
                self.allBooks = books
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func fetchCharacters() async {
        guard let url = URL(string: "https://potterapi-fedeperin.vercel.app/en/characters") else {
            print(ApiError.invalidURL.errorDescription ?? "Invalid URL error")
            return
        }
        
        do {
            let data = try await fetchData(from: url)
            let characters = try JSONDecoder().decode([Character].self, from: data)
            DispatchQueue.main.async {
                self.allCharacters = characters
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func fetchData(from url: URL) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.isOK else {
            throw ApiError.unknown
        }
        return data
    }
    
}
