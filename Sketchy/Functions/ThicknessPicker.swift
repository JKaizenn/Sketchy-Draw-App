import SwiftUI

struct ThicknessPicker: View {
    @Binding var selectedThickness: CGFloat
    @Binding var isDarkMode: Bool

    var body: some View {
        HStack {
            ForEach([1, 2, 3, 4, 5, 6], id: \.self) { thickness in
                Button(action: {
                    selectedThickness = CGFloat(thickness)
                }) {
                    Circle()
                        .stroke(lineWidth: selectedThickness == CGFloat(thickness) ? 3 : 1)
                        .background(Circle().fill(isDarkMode ? Color.white : Color.clear))
                        .frame(width: 30, height: 30)
                        .padding(5)
                }
            }
        }
        .padding()
    }
}

struct ThicknessPicker_Previews: PreviewProvider {
    static var previews: some View {
        ThicknessPicker(selectedThickness: .constant(2), isDarkMode: .constant(false))
    }
}
