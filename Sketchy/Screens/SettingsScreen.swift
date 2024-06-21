import SwiftUI

struct SettingsScreen: View {
    let backAction: () -> Void
    @Binding var isDarkMode: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Toggle(isOn: $isDarkMode) {
                Text("Dark Mode")
                    .font(.headline)
                    .foregroundColor(isDarkMode ? .white : .black)
            }
            .padding(.top, 20)

            Spacer()

            Button(action: backAction) {
                Text("Back")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }

            Spacer()
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
