import SwiftUI
import Kingfisher

struct BookImageView: View {
    
    let book: Book
    
    var body: some View {
        KFImage(URL(string: book.cover))
            .placeholder {
                ProgressView()
            }
            .resizable()
            .scaledToFit()
            .cornerRadius(8)
    }
    
}

#Preview {
    BookImageView(book: MockData.book)
}
