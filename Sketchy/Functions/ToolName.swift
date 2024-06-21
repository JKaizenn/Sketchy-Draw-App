import SwiftUI

enum SketchTool: String, CaseIterable, Identifiable {
    case pen, brush, pencil, sprayPaint

    var id: String { self.rawValue }
}
