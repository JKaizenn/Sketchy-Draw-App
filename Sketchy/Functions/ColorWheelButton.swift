import SwiftUI

struct ColorWheelButton: View {
    @Binding var selectedColor: Color

    var body: some View {
        // Your existing implementation for ColorWheelButton
        Circle()
            .fill(selectedColor)
            .frame(width: 30, height: 30)
            .onTapGesture {
                // Your logic to change the color
            }
    }
}

struct ColorWheelButton_Previews: PreviewProvider {
    static var previews: some View {
        ColorWheelButton(selectedColor: .constant(.red))
    }
}
