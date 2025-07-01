import SwiftUI

struct HomeScreen: View {
    let newFileAction: () -> Void
    let loadExistingAction: (URL?) -> Void
    let settingsAction: () -> Void
    @Binding var isDarkMode: Bool

    @State private var showFilePicker = false

    var body: some View {
        VStack {
            // Title banner with animated text
            ZStack {
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [.blue, .purple]),
                        startPoint: .leading,
                        endPoint: .trailing
                    ))
                    .frame(height: 100)
                    .cornerRadius(10)
                    .padding()
                
                Text("Sketchy")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .scaleEffect(1.2)
                    .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: true)
                    .onAppear {
                        withAnimation {
                            true
                        }
                    }
            }

            Spacer()
            
            Button(action: newFileAction) {
                Text("New File")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom, 10)
            
            Button(action: {
                self.showFilePicker = true
            }) {
                Text("Load Existing")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom, 10)
            .fileImporter(
                isPresented: $showFilePicker,
                allowedContentTypes: [.json],
                allowsMultipleSelection: false
            ) { result in
                switch result {
                case .success(let urls):
                    self.loadExistingAction(urls.first)
                case .failure(let error):
                    print("Failed to load file: \(error.localizedDescription)")
                }
            }
            
            Button(action: settingsAction) {
                Text("Settings")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .background(AnimatedBackground())
    }
}
