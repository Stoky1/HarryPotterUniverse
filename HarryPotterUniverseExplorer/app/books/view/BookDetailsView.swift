import SwiftUI

struct BookDetailsView: View {
    
    let book: Book
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading,
                   spacing: 16) {
                HStack {
                    Spacer()
                    BookImageView(book: book)
                        .scaledToFit()
                        .cornerRadius(10)
                        .frame(height: 300)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.branding.burgundy.opacity(0.2))
                        )
                    Spacer()
                }
                Text(book.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .fontDesign(.serif)
                    .foregroundColor(.branding.accent)
                    .padding(.horizontal)
                
                Spacer()
                
                Text("About")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .fontDesign(.serif)
                    .foregroundColor(.branding.accent)
                    .padding(.horizontal)
                
                Text(book.description)
                    .font(.body)
                    .foregroundColor(.branding.pearl)
                    .padding(.horizontal)
                    .fontDesign(.serif)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.branding.burgundy.opacity(0.2))
                            .padding(-8)
                        
                    )
                
                Spacer()

                
                Text("Release date")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .fontDesign(.serif)
                    .foregroundColor(.branding.accent)
                    .padding(.horizontal)
                
                Text(book.releaseDate)
                    .font(.body)
                    .foregroundColor(.branding.pearl)
                    .padding(.horizontal)
                    .fontDesign(.serif)
                
                Spacer()
                                    
                Text("Number of pages")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .fontDesign(.serif)
                    .foregroundColor(.branding.accent)
                    .padding(.horizontal)
                
                Text("\(book.pages)")
                    .font(.body)
                    .foregroundColor(.branding.pearl)
                    .padding(.horizontal)
                    .fontDesign(.serif)
                Spacer()
                    
            }
        }
        .background(Color.branding.background.ignoresSafeArea())
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Book Details")
                    .font(.headline)
                    .fontDesign(.serif)
                    .foregroundColor(.branding.accent)
            }
        }
    }
}

#Preview {
    BookDetailsView(book: MockData.book)
}

