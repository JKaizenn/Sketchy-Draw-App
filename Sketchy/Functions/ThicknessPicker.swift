import SwiftUI

struct LineThicknessPicker: View {
    @Binding var selectedThickness: CGFloat

    var body: some View {
        HStack {
            ForEach(1...6, id: \.self) { index in
                Button(action: {
                    self.selectedThickness = CGFloat(index)
                }) {
                    Circle()
                        .fill(self.selectedThickness == CGFloat(index) ? Color.blue : Color.gray)
                        .frame(width: CGFloat(index * 5), height: CGFloat(index * 5))
                }
                .padding(2)
            }
        }
    }
}

struct LineThicknessPicker_Previews: PreviewProvider {
    static var previews: some View {
        LineThicknessPicker(selectedThickness: .constant(2))
    }
}
