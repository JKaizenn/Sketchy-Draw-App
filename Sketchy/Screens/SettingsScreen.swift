import SwiftUI

struct SettingsScreen: View {
    let backAction: () -> Void
    @Binding var isDarkMode: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Toggle(isOn: $isDarkMode) {
                Text("Dark Mode")
                    .font(.headline)
                    .padding(.top, 20) // Add padding to the dark mode toggle
            }
            .padding()

            Spacer()

            Button(action: {
                backAction()
            }) {
                Text("Back")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding(.bottom, 20)
        }
        .padding()
        .background(isDarkMode ? Color.black : Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen(backAction: {}, isDarkMode: .constant(false))
    }
}
