import SwiftUI

enum DrawTools: String, CaseIterable, Identifiable {
    case pen, brush, pencil, sprayPaint

    var id: String { self.rawValue }
}

struct ToolPicker: View {
    @Binding var selectedTool: ToolName

    var body: some View {
        Menu {
            ForEach(ToolName.allCases) { tool in
                Button(action: {
                    selectedTool = tool
                }) {
                    Label(tool.rawValue.capitalized, systemImage: toolIcon(for: tool))
                }
            }
        } label: {
            Text("Tools")
                .padding()
                .background(Color.gray.opacity(0.2))
                .foregroundColor(.black)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
    }

    private func toolIcon(for tool: DrawTools) -> String {
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
