import SwiftUI

struct ColorPicker: View {
    @Binding var selectedColor: Color

    var body: some View {
        HStack {
            ForEach([Color.red, Color.orange, Color.yellow, Color.green, Color.blue, Color.purple, Color.black], id: \.self) { color in
                Circle()
                    .fill(color)
                    .frame(width: 30, height: 30)
                    .onTapGesture {
                        selectedColor = color
                    }
                    .padding(5)
            }
            ColorWheelButton(selectedColor: $selectedColor)
                .padding(5)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

struct ColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        ColorPicker(selectedColor: .constant(.red))
    }
}
