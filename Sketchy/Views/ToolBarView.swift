import SwiftUI

struct ToolBarView: View {
    let clearAction: () -> Void
    let penAction: () -> Void
    let eraserToggleAction: () -> Void
    let isEraserOn: Bool
    @Binding var selectedThickness: CGFloat

    var body: some View {
        VStack {
            HStack {
                Spacer()
                AnimatedButton(action: clearAction) {
                    Text("Clear")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                Spacer()
                AnimatedButton(action: penAction) {
                    Text("Pen")
                        .padding()
                        .background(isEraserOn ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                Spacer()
                AnimatedButton(action: eraserToggleAction) {
                    Text("Eraser")
                        .padding()
                        .background(isEraserOn ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                Spacer()
            }
            .padding(.top, 10)
            LineThicknessPicker(selectedThickness: $selectedThickness)
        }
    }
}

struct ToolBarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolBarView(
            clearAction: {},
            penAction: {},
            eraserToggleAction: {},
            isEraserOn: false,
            selectedThickness: .constant(2)
        )
    }
}
