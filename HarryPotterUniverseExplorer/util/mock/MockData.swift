import SwiftUI
import Foundation

class MockData {
    
    static var book: Book {
        Book(number: 1,
             title: "Harry Potter and the Sorcerer's Stone",
             originalTitle: "Harry Potter and the Sorcerer's Stone",
             releaseDate: "Jun 26, 1997",
             description: "On his birthday, Harry Potter discovers that he is the son of two well-known wizards, from whom he has inherited magical powers. He must attend a famous school of magic and sorcery, where he establishes a friendship with two young men who will become his companions on his adventure. During his first year at Hogwarts, he discovers that a malevolent and powerful wizard named Voldemort is in search of a philosopher's stone that prolongs the life of its owner.",
             pages: 223,
             cover: "https://raw.githubusercontent.com/fedeperin/potterapi/main/public/images/covers/1.png",
             index: 0)
    }
    
    static var character: Character {
        Character(fullName: "Harry James Potter",
                  nickname: "Harry",
                  hogwartsHouse: .gryffindor,
                  interpretedBy: "Daniel Radcliffe",
                  children: [
                    "James Sirius Potter",
                    "Albus Severus Potter",
                    "Lily Luna Potter"
                  ],
                  image: "https://raw.githubusercontent.com/fedeperin/potterapi/main/public/images/characters/harry_potter.png",
                  birthdate: "Sep 19, 1979",
                  index: 1)
    }
    
}
