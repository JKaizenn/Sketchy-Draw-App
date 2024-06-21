import SwiftUI

struct SketchScreen: View {
    let backAction: () -> Void
    @State private var currentLine: [CGPoint] = []
    @State private var lines: [Line] = []
    @State private var selectedColor: Color = .black
    @State private var selectedThickness: CGFloat = 2
    @State private var selectedTool: ToolName = .pen
    @State private var isEraserOn: Bool = false
    @State private var showColorWheel: Bool = false
    @Binding var isDarkMode: Bool

    var body: some View {
        VStack {
            HStack {
                Button(action: backAction) {
                    Image(systemName: "arrow.backward")
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                Spacer()
                AnimatedButton(action: {
                    self.lines.removeAll()
                }) {
                    Text("Clear")
                        .padding()
                        .background(Color.red.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                Spacer()
                ToolPicker(selectedTool: $selectedTool)
                Spacer()
                AnimatedButton(action: {
                    self.isEraserOn.toggle()
                }) {
                    Text("Eraser")
                        .padding()
                        .background(isEraserOn ? Color.blue : Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                Spacer()
                ColorPicker(selectedColor: $selectedColor)
                Spacer()
            }
            .padding()

            // Canvas to draw lines
            CanvasView(lines: $lines, currentLine: $currentLine, selectedColor: $selectedColor, selectedThickness: $selectedThickness, isEraserOn: $isEraserOn)

            Spacer()
        }
        .background(isDarkMode ? Color.black : Color.white)
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $showColorWheel) {
            ColorWheelView(selectedColor: $selectedColor)
        }
    }
}

struct SketchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SketchScreen(backAction: {}, isDarkMode: .constant(false))
    }
}
