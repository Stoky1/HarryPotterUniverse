import SwiftUI

struct BookItemView: View {
    
    let book: Book
    
    var body: some View {
        HStack(spacing: 0) {
            NavigationLink(destination: BookDetailsView(book: book)) {
                image
                content
            }
            .buttonStyle(PlainButtonStyle())
        }
        .background(Color.branding.background)
    }
    
}

#Preview {
    BookItemView(book: MockData.book)
}

extension BookItemView {
    
    private var content: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("#\(book.number)")
                .font(.title2)
                .fontWeight(.bold)
                .fontDesign(.serif)
                .foregroundColor(.branding.accent)
            Text(book.title)
                .font(.title)
                .fontWeight(.bold)
                .fontDesign(.serif)
                .foregroundColor(.branding.accent)
            Text("Released on \(book.releaseDate)")
                .foregroundColor(.branding.pearl)
                .fontWeight(.heavy)
                .fontDesign(.serif)
                .font(.caption2)
        }
        .padding()
        .background(Color.branding.background)
    }
    
    private var image: some View {
        BookImageView(book: book)
            .cornerRadius(10)
            .frame(width: 100, height: 200)
    }
    
}
