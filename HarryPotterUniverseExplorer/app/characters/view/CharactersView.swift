import SwiftUI

struct CharactersView: View {
    
    @EnvironmentObject
    private var characterViewModel: CharacterViewModel
    
    @State
    private var searchText = ""
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.branding.background
                    .ignoresSafeArea()
                
                VStack {
                    Text("Harry Potter Universe - Characters")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .fontDesign(.serif)
                        .foregroundColor(.branding.accent)
                        .padding()
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 8) {
                            ForEach(filteredCharacters.indices,
                                    id: \.self) { index in
                                CharacterItemView(character: filteredCharacters[index])
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .searchable(text: $searchText,
                            prompt: "Search characters...")
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity,
                       alignment: .top)
            }
        }
    }
    
    private var filteredCharacters: [Character] {
        if searchText.isEmpty {
            return characterViewModel.allCharacters
        } else {
            return characterViewModel.allCharacters.filter { $0.fullName.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
