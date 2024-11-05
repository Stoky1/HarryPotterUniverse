import SwiftUI
import Kingfisher

struct CharacterDetailsView: View {
    
    let character: Character
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading,
                   spacing: 16) {
                KFImage(URL(string: character.image))
                    .resizable()
                    .scaledToFill()
                    .frame(height: 400)
                    .clipped()
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(houseTextColor,
                                lineWidth: 4))
                    .padding()
                
                Text(character.fullName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .fontDesign(.serif)
                    .foregroundColor(houseTextColor)
                    .padding(.horizontal)
                    .fontDesign(.serif)
                
                
                VStack(alignment: .leading,
                       spacing: 8) {
                    keyValueRow(title: "Nickname",
                                value: character.nickname)
                    keyValueRow(title: "House",
                                value: character.hogwartsHouse.rawValue)
                    keyValueRow(title: "Birthdate",
                                value: character.birthdate)
                    keyValueRow(title: "Interpreted by",
                                value: character.interpretedBy)
                }
                       .padding(.horizontal)
                
                if !character.children.isEmpty {
                    Text("Children")
                        .font(.headline)
                        .fontWeight(.bold)
                        .fontDesign(.serif)
                    
                        .foregroundColor(houseTextColor)
                        .padding(.horizontal)
                    
                    ForEach(character.children, id: \.self) { child in
                        Text("⚡️\(child)")
                            .font(.body)
                            .fontDesign(.serif)
                            .foregroundColor(houseTextColor)
                            .padding(.horizontal, 24)
                    }
                }
            }
                   .padding(.bottom)
        }
        .background(houseBackgroundColor.ignoresSafeArea())
        .navigationTitle("Character details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(character.fullName)
                    .font(.headline)
                    .fontDesign(.serif)
                    .foregroundColor(houseTextColor)
            }
        }
    }
    
    private func keyValueRow(title: String,
                             value: String) -> some View {
        VStack(alignment: .leading,
               spacing: 4) {
            Text("\(title)")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(houseTextColor)
                .fontDesign(.serif)
            
            Text(value)
                .font(.title2)
                .foregroundColor(houseTextColor)
                .fontDesign(.serif)
            
            Spacer()
        }
    }
}

#Preview {
    CharacterDetailsView(character: MockData.character)
}

extension CharacterDetailsView {
    
    private var houseBackgroundColor: Color {
        return switch character.hogwartsHouse {
        case .gryffindor: .branding.gryffindor
        case .slytherin: .branding.slytherin
        case .hufflepuff: .branding.hufflepuff
        case .ravenclaw: .branding.ravenclaw
        }
    }
    
    private var houseTextColor: Color {
        return switch character.hogwartsHouse {
        case .gryffindor: .branding.gryffindorAccent
        case .slytherin: .branding.slytherinAccent
        case .hufflepuff: .branding.hufflepuffAccent
        case .ravenclaw: .branding.ravenclawAccent
        }
    }
    
}
