import SwiftUI

struct CanvasView: View {
    @Binding var lines: [Line]
    @Binding var currentLine: [CGPoint]
    @Binding var selectedColor: Color
    @Binding var selectedThickness: CGFloat
    @Binding var isEraserOn: Bool

    var body: some View {
        ZStack {
            ForEach(lines) { line in
                Path { path in
                    addLine(to: &path, from: line.points)
                }
                .stroke(line.color, lineWidth: line.thickness)
            }
            Path { path in
                addLine(to: &path, from: currentLine)
            }
            .stroke(isEraserOn ? Color.white : selectedColor, lineWidth: selectedThickness)
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
