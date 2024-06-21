import SwiftUI

struct ColorWheelButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Circle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 40, height: 40)
        }
    }
}
