import SwiftUI

enum DrawTools: String, CaseIterable, Identifiable {
    case pen
    case brush
    case pencil
    case sprayPaint

    var id: String { self.rawValue }
}
