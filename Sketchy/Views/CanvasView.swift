import SwiftUI

struct CanvasView: View {
    @Binding var lines: [Line]
    @Binding var currentLine: [CGPoint]
    @Binding var selectedColor: Color
    @Binding var selectedThickness: CGFloat
    @Binding var isEraserOn: Bool
    @Binding var selectedTool: SketchTool

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(self.lines) { line in
                    Path { path in
                        self.addLine(to: &path, from: line.points)
                    }
                    .stroke(line.color, lineWidth: line.thickness)
                }

                Path { path in
                    self.addLine(to: &path, from: self.currentLine)
                }
                .stroke(self.isEraserOn ? Color.white : self.selectedColor, lineWidth: self.selectedThickness)
            }
            .contentShape(Rectangle())
            .gesture(DragGesture(minimumDistance: 0.1)
                        .onChanged { value in
                            let point = value.location
                            if point.y > 50 { // Prevent drawing inside the tool area
                                self.currentLine.append(point)
                            }
                        }
                        .onEnded { _ in
                            if !self.currentLine.isEmpty {
                                self.lines.append(Line(points: self.currentLine, color: self.isEraserOn ? .white : self.selectedColor, thickness: self.selectedThickness))
                                self.currentLine = []
                            }
                        }
            )
        }
    }

    private func addLine(to path: inout Path, from points: [CGPoint]) {
        guard let firstPoint = points.first else { return }
        path.move(to: firstPoint)
        for point in points.dropFirst() {
            path.addLine(to: point)
        }
    }
}
