import SwiftUI

@main
struct HarryPotterUniverseExplorerApp: App {
    
    @StateObject
    private var bookViewModel = BookViewModel()
    
    @StateObject
    private var characterViewModel = CharacterViewModel()
    
    @State
    private var showLaunchView = true
    
    var body: some Scene {
        WindowGroup {
            if showLaunchView {
                LaunchView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation {
                                showLaunchView = false
                            }
                        }
                    }
            } else {
                TabView {
                    // tab 1
                    NavigationView {
                        BookView()
                            .navigationBarHidden(true)
                            .environmentObject(bookViewModel)
                    }
                    .tabItem {
                        Image("hp-books")
                            .renderingMode(.template)
                        Text("Books")
                    }
                    
                    // tab 2
                    NavigationView {
                        CharactersView()
                            .navigationBarHidden(true)
                            .environmentObject(characterViewModel)
                    }
                    .tabItem {
                        Image("hp-characters")
                            .renderingMode(.template)
                        Text("Characters")
                    }
                }
                .accentColor(.branding.accent)
            }
        }
    }
}
