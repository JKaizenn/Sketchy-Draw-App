import SwiftUI

func drawWithPen(points: [CGPoint], color: Color, thickness: CGFloat) -> Line {
    // Custom drawing logic for pen
    return Line(points: points, color: color, thickness: thickness)
}

func drawWithBrush(points: [CGPoint], color: Color, thickness: CGFloat) -> Line {
    // Custom drawing logic for brush
    return Line(points: points, color: color, thickness: thickness)
}

func drawWithPencil(points: [CGPoint], color: Color, thickness: CGFloat) -> Line {
    // Custom drawing logic for pencil
    return Line(points: points, color: color, thickness: thickness)
}

func drawWithSprayPaint(points: [CGPoint], color: Color, thickness: CGFloat) -> Line {
    // Custom drawing logic for spray paint
    return Line(points: points, color: color, thickness: thickness)
}
