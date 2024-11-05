import Foundation

struct Book: Codable, Identifiable {
    
    let number: Int
    let title: String
    let originalTitle: String
    let releaseDate: String
    let description: String
    let pages: Int
    let cover: String
    let index: Int?
    
    var id: String? = UUID().uuidString
    
}
