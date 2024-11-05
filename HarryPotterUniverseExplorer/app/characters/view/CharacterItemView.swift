import SwiftUI
import Kingfisher

struct CharacterItemView: View {
    
    let character: Character
    
    var body: some View {
        NavigationLink(destination: CharacterDetailsView(character: character)) {
            VStack {
                characterImage
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.branding.accent, lineWidth: 2))
                    .shadow(radius: 4)
                
                Text(character.fullName)
                    .font(.subheadline)
                    .fontWeight(.heavy)
                    .fontDesign(.serif)
                    .foregroundColor(.branding.accent)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.branding.burgundy.opacity(0.1))
            )
            .padding([.horizontal, .top])
        }
    }
    
}

#Preview {
    CharacterItemView(character: MockData.character)
}

extension CharacterItemView {
    
    private var characterImage: some View {
        KFImage(URL(string: character.image))
            .resizable()
            .scaledToFill()
    }
    
}
