import SwiftUI

struct ContentView: View {
    @State private var showHomeScreen = true
    @State private var showSketchScreen = false
    @State private var showSettingsScreen = false
    @State private var isDarkMode = false

    var body: some View {
        ZStack {
            if showHomeScreen {
                HomeScreen(
                    newFileAction: {
                        self.showHomeScreen = false
                        self.showSketchScreen = true
                    },
                    loadExistingAction: { url in
                        // Implement load existing logic here
                        print("Loaded file from: \(url?.absoluteString ?? "Invalid URL")")
                    },
                    settingsAction: {
                        self.showHomeScreen = false
                        self.showSettingsScreen = true
                    },
                    isDarkMode: $isDarkMode
                )
            } else if showSketchScreen {
                SketchScreen(
                    backAction: {
                        self.showSketchScreen = false
                        self.showHomeScreen = true
                    },
                    isDarkMode: $isDarkMode
                )
            } else if showSettingsScreen {
                SettingsScreen(
                    backAction: {
                        self.showSettingsScreen = false
                        self.showHomeScreen = true
                    },
                    isDarkMode: $isDarkMode
                )
            }
        }
        .ignoresSafeArea(edges: .all)
        .background(isDarkMode ? Color.black : Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
        
        ContentView()
            .previewDevice("iPad Pro (11-inch) (3rd generation)")
    }
}
