import SwiftUI

struct AnimatedBackground: View {
    @State private var animate = false

    var body: some View {
        ZStack {
            ForEach(0..<30) { i in
                Circle()
                    .fill(self.randomColor())
                    .frame(width: CGFloat.random(in: 20...100), height: CGFloat.random(in: 20...100))
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                    )
                    .offset(
                        x: animate ? CGFloat.random(in: -50...50) : 0,
                        y: animate ? CGFloat.random(in: -50...50) : 0
                    )
                    .animation(
                        Animation.easeInOut(duration: 5)
                            .repeatForever()
                            .delay(Double.random(in: 0...2))
                    )
            }
        }
        .onAppear {
            self.animate.toggle()
        }
    }

    func randomColor() -> Color {
        let colors: [Color] = [.red, .green, .blue, .yellow, .purple, .orange, .pink, .cyan, .mint, .indigo]
        return colors.randomElement() ?? .blue
    }
}

struct AnimatedBackground_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedBackground()
    }
}
