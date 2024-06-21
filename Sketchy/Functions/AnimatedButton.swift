import SwiftUI

struct AnimatedButton<Content: View>: View {
    let action: () -> Void
    let content: () -> Content

    var body: some View {
        Button(action: {
            withAnimation {
                action()
            }
        }) {
            content()
                .scaleEffect(1.1)
                .animation(.easeInOut)
        }
    }
}
