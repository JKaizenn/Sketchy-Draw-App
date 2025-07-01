import SwiftUI

struct SketchScreen: View {
    let backAction: () -> Void
    @State private var currentLine: [CGPoint] = []
    @State private var lines: [Line] = []
    @State private var selectedColor: Color = .black
    @State private var selectedThickness: CGFloat = 2
    @State private var selectedTool: SketchTool = .pen
    @State private var isEraserOn: Bool = false
    @State private var showColorWheel: Bool = false
    @State private var showThicknessPicker: Bool = false
    @Binding var isDarkMode: Bool

    var body: some View {
        VStack {
            HStack {
                Button(action: backAction) {
                    Image(systemName: "arrow.backward")
                        .padding(6)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(6)
                        .frame(width: 50, height: 50)
                }
                Spacer()
                AnimatedButton(action: {
                    self.lines.removeAll()
                }) {
                    Text("Clear")
                        .padding(6)
                        .background(Color.red.opacity(0.2))
                        .cornerRadius(6)
                        .foregroundColor(.white)
                        .frame(width: 70, height: 50)
                }
                Spacer()
                ToolPicker(selectedTool: $selectedTool)
                    .frame(width: 80, height: 50)
                Spacer()
                AnimatedButton(action: {
                    self.isEraserOn.toggle()
                }) {
                    Text("Eraser")
                        .padding(6)
                        .background(isEraserOn ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                        .frame(width: 80, height: 50)
                }
                Spacer()
                ColorPicker(selectedColor: $selectedColor, selectedThickness: $selectedThickness)
                Spacer()
                Button(action: {
                    self.showColorWheel.toggle()
                }) {
                    Image(systemName: "paintpalette")
                        .padding(6)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(6)
                        .frame(width: 50, height: 50)
                }
            }
            .padding()
            .background(Color(isDarkMode ? .black : .white))
            .foregroundColor(isDarkMode ? .white : .black)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 3) // Thicker border
            )
            .zIndex(1) // Ensures this HStack is above the canvas

            CanvasView(lines: $lines, currentLine: $currentLine, selectedColor: $selectedColor, selectedThickness: $selectedThickness, isEraserOn: $isEraserOn, selectedTool: $selectedTool)
                .background(Color.white)
                .gesture(DragGesture().onChanged { _ in
                    // Prevent drawing inside the tool area by not handling gestures here
                })
        }
        .sheet(isPresented: $showColorWheel) {
            ColorWheelView(selectedColor: $selectedColor)
        }
    }
}
