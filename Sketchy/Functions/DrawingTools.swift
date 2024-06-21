import SwiftUI

func drawWithPen(points: [CGPoint], color: Color, thickness: CGFloat) -> Line {
    // Drawing logic for pen (simple line)
    return Line(points: points, color: color, thickness: thickness)
}

func drawWithBrush(points: [CGPoint], color: Color, thickness: CGFloat) -> Line {
    // Drawing logic for brush (could be a thicker line with some variance)
    let modifiedThickness = thickness + CGFloat.random(in: -1...1)
    return Line(points: points, color: color, thickness: modifiedThickness)
}

func drawWithPencil(points: [CGPoint], color: Color, thickness: CGFloat) -> Line {
    // Drawing logic for pencil (could be a thinner line with some texture)
    let modifiedThickness = thickness / 2
    return Line(points: points, color: color, thickness: modifiedThickness)
}

func drawWithSprayPaint(points: [CGPoint], color: Color, thickness: CGFloat) -> Line {
    // Drawing logic for spray paint (simulating a spray effect with splatter)
    var splatterPoints: [CGPoint] = []
    for point in points {
        for _ in 0..<5 {
            let offsetX = CGFloat.random(in: -5...5)
            let offsetY = CGFloat.random(in: -5...5)
            splatterPoints.append(CGPoint(x: point.x + offsetX, y: point.y + offsetY))
        }
    }
    return Line(points: splatterPoints, color: color, thickness: thickness / 2)
}
