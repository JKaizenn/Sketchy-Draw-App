import SwiftUI

struct Line: Identifiable, Codable {
    var id = UUID()
    var points: [CGPoint]
    var color: Color
    var thickness: CGFloat

    enum CodingKeys: String, CodingKey {
        case id
        case points
        case color
        case thickness
    }

    init(points: [CGPoint], color: Color, thickness: CGFloat) {
        self.points = points
        self.color = color
        self.thickness = thickness
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        points = try container.decode([CGPoint].self, forKey: .points)
        let colorData = try container.decode(Data.self, forKey: .color)
        color = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(colorData) as? Color ?? .black
        thickness = try container.decode(CGFloat.self, forKey: .thickness)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(points, forKey: .points)
        let colorData = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false)
        try container.encode(colorData, forKey: .color)
        try container.encode(thickness, forKey: .thickness)
    }
}
