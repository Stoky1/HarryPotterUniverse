import Foundation

extension HTTPURLResponse {
    
    var isOK: Bool {
        self.statusCode >= 200 && self.statusCode < 300
    }
    
}
