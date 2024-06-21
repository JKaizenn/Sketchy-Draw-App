import SwiftUI

struct ToolBarView: View {
    @Binding var selectedThickness: CGFloat
    @Binding var isDarkMode: Bool

    var clearAction: () -> Void
    var penAction: () -> Void
    var eraserToggleAction: () -> Void
    var isEraserOn: Bool

    var body: some View {
        VStack {
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
            AnimatedButton(action: clearAction) {
                Text("Clear")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            Spacer()
            ThicknessPicker(selectedThickness: $selectedThickness, isDarkMode: $isDarkMode)
                .padding(.top, 10)
        }
    }
}

struct ToolBarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolBarView(
            selectedThickness: .constant(2),
            isDarkMode: .constant(false),
            clearAction: {},
            penAction: {},
            eraserToggleAction: {},
            isEraserOn: false
        )
    }
}
