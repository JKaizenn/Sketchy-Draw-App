import SwiftUI

struct ColorWheelView: View {
    @Binding var selectedColor: Color
    @State private var red: Double = 0.0
    @State private var green: Double = 0.0
    @State private var blue: Double = 0.0
    @State private var hexCode: String = "#000000"

    var body: some View {
        VStack {
            SwiftUI.ColorPicker("Choose Color", selection: $selectedColor)
                .padding()
                .onChange(of: selectedColor) { newValue in
                    updateRGB(from: newValue)
                    updateHex(from: newValue)
                }

            VStack {
                HStack {
                    Text("R")
                    Slider(value: $red, in: 0...1)
                        .accentColor(.red)
                }

                HStack {
                    Text("G")
                    Slider(value: $green, in: 0...1)
                        .accentColor(.green)
                }

                HStack {
                    Text("B")
                    Slider(value: $blue, in: 0...1)
                        .accentColor(.blue)
                }

                HStack {
                    Text("Hex")
                    TextField("#000000", text: $hexCode)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: hexCode) { newValue in
                            updateColor(from: newValue)
                        }
                }
            }
            .padding()
            .onChange(of: red) { _ in updateColor() }
            .onChange(of: green) { _ in updateColor() }
            .onChange(of: blue) { _ in updateColor() }

            Spacer()
        }
        .padding()
        .onAppear {
            updateRGB(from: selectedColor)
            updateHex(from: selectedColor)
        }
    }

    private func updateRGB(from color: Color) {
        if let components = color.cgColor?.components {
            red = Double(components[0])
            green = Double(components[1])
            blue = Double(components[2])
        }
    }

    private func updateHex(from color: Color) {
        if let components = color.cgColor?.components {
            let r = Int(components[0] * 255)
            let g = Int(components[1] * 255)
            let b = Int(components[2] * 255)
            hexCode = String(format: "#%02X%02X%02X", r, g, b)
        }
    }

    private func updateColor() {
        selectedColor = Color(red: red, green: green, blue: blue)
    }

    private func updateColor(from hex: String) {
        var hexString = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        if hexString.count == 6 {
            let scanner = Scanner(string: hexString)
            var hexNumber: UInt64 = 0
            if scanner.scanHexInt64(&hexNumber) {
                let r = Int((hexNumber & 0xFF0000) >> 16)
                let g = Int((hexNumber & 0x00FF00) >> 8)
                let b = Int(hexNumber & 0x0000FF)
                selectedColor = Color(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255)
            }
        }
    }
}
