import SwiftUI

struct AnimatedBackground: View {
    @State private var animate = false

    var body: some View {
        ZStack {
            ForEach(0..<30) { i in
                Circle()
                    .fill(Color.blue.opacity(0.2))
                    .frame(width: CGFloat.random(in: 50...150), height: CGFloat.random(in: 50...150))
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                    )
                    .offset(
                        x: animate ? CGFloat.random(in: -50...50) : 0,
                        y: animate ? CGFloat.random(in: -50...50) : 0
                    )
                    .animation(
                        Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: true)
                            .delay(Double(i) * 0.1),
                        value: animate
                    )
            }
        }
        .onAppear {
            animate = true
        }
    }
}

struct AnimatedBackground_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedBackground()
    }
}
