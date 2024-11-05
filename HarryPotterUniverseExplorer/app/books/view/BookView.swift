import SwiftUI

struct BookView: View {
    
    @EnvironmentObject
    private var bookViewModel: BookViewModel
    
    @State
    private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Text("Harry Potter Universe - Books")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .fontDesign(.serif)
                    .foregroundColor(.branding.accent)
                    .padding()
                
                ScrollView {
                    LazyVStack {
                        ForEach(filteredBooks.indices,
                                id: \.self) { index in
                            BookItemView(book: filteredBooks[index])
                        }
                    }
                }
                .padding(.top, 8)
                
            }
            .searchable(text: $searchText,
                        prompt: "Search books...")
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .top)
            .background(Color.branding.background.ignoresSafeArea())
        }
    }
    
    private var filteredBooks: [Book] {
        if searchText.isEmpty {
            return bookViewModel.allBooks
        } else {
            return bookViewModel.allBooks.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
