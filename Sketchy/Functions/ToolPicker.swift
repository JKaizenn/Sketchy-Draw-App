import SwiftUI

struct ToolPicker: View {
    @Binding var selectedTool: SketchTool

    var body: some View {
        Menu {
            ForEach(SketchTool.allCases) { tool in
                Button(action: {
                    selectedTool = tool
                }) {
                    Label(tool.rawValue.capitalized, systemImage: toolIcon(for: tool))
                }
            }
        } label: {
            Text("Tools")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
    }

    private func toolIcon(for tool: SketchTool) -> String {
        switch tool {
        case .pen:
            return "pencil.tip"
        case .brush:
            return "paintbrush"
        case .pencil:
            return "pencil"
        case .sprayPaint:
            return "spraypaint"
        }
    }
}

struct ToolPicker_Previews: PreviewProvider {
    static var previews: some View {
        ToolPicker(selectedTool: .constant(.pen))
    }
}
