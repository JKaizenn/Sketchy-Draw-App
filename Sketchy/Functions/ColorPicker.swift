import SwiftUI

struct ColorPicker: View {
    @Binding var selectedColor: Color
    @Binding var selectedThickness: CGFloat

    var body: some View {
        VStack {
            HStack {
                ForEach([Color.red, Color.orange, Color.yellow, Color.green, Color.blue, Color.purple, Color.black], id: \.self) { color in
                    Circle()
                        .fill(color)
                        .frame(width: 20, height: 20)
                        .onTapGesture {
                            selectedColor = color
                        }
                        .padding(3)
                }
                .padding(4)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 2) // Thicker border
                )
            }
            HStack {
                ForEach([CGFloat(1), CGFloat(2), CGFloat(3), CGFloat(4), CGFloat(5), CGFloat(6)], id: \.self) { thickness in
                    Circle()
                        .fill(selectedThickness == thickness ? Color.gray : Color.clear)
                        .frame(width: 20, height: 20)
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 2)
                                .frame(width: CGFloat(thickness * 5), height: CGFloat(thickness * 5))
                        )
                        .onTapGesture {
                            selectedThickness = thickness
                        }
                        .padding(3)
                }
                .padding(4)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 2) // Thicker border
                )
            }
        }
    }
}
