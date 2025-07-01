/***********************************************************************
 * Source File:
 *    DRAWING DOCUMENT
 * Author:
 *    Jessen Forbush
 * Summary:
 *    The main data model that represents a complete drawing session.
 ************************************************************************/

import SwiftUI


struct DrawingDocument {
   
   var lines: [Line] = []
   
   /// Current drawing settings and preferences
   var settings: DrawingSettings = DrawingSettings()
   
   // MARK: - Metadata
   /// Unique identifier for this document
   let id = UUID()
   
   /// When this document was last modified
   ///
   /// Automatically updated whenever the document changes.
   var lastModified = Date()
   
   // MARK: - Computed Properties
   
   /// How many lines are in this drawing
   ///
   /// - Returns: The number of lines currently in the drawing
   var lineCount: Int {
      return lines.count
   }
   
   /// Whether this drawing is empty (has no lines)
   ///
   /// - Returns: true if there are no lines drawn yet
   var isEmpty: Bool {
      return lines.isEmpty
   }
   
   // MARK: - Initializers
   
   /// Creates a new empty drawing document
   ///
   /// This is the DEFAULT INITIALIZER. In Swift, if you don't
   /// write any custom initializers, you get one automatically
   /// that sets all properties to their default values.
   ///
   /// Since we used default values above (lines = [], settings = DrawingSettings()),
   /// we don't actually need to write this - Swift creates it for us.
   /// But it's good to understand what's happening.
   ///
   /// ## Example:
   /// ```swift
   /// let newDrawing = DrawingDocument()
   /// print(newDrawing.isEmpty) // true
   /// ```
   init() {
      // All properties already have default values, so nothing to do here!
      // Swift automatically sets:
      // - lines to empty array
      // - settings to new DrawingSettings()
      // - id to new UUID()
      // - lastModified to current Date()
   }
   
   // MARK: - Methods
   
   /// Adds a new line to this drawing
   ///
   /// This method MODIFIES the document, so we need the `mutating` keyword.
   /// In C++ classes, any method can modify the object. In Swift structs,
   /// you must explicitly mark methods that change the struct as `mutating`.
   ///
   /// - Parameter line: The Line object to add to the drawing
   ///
   /// ## Example:
   /// ```swift
   /// var document = DrawingDocument()
   /// let newLine = Line(points: [CGPoint(x: 0, y: 0)], color: .red, thickness: 2.0)
   /// document.addLine(newLine)
   /// ```
   mutating func addLine(_ line: Line) {
      lines.append(line)
      lastModified = Date() // Update the modification time
   }
   
   /// Removes the most recently added line
   ///
   /// This is like an "undo" operation. Removes the last line
   /// that was added to the drawing.
   ///
   /// - Returns: The line that was removed, or nil if no lines exist
   ///
   /// ## Example:
   /// ```swift
   /// var document = DrawingDocument()
   /// document.addLine(someLine)
   /// let removedLine = document.removeLastLine() // Gets back someLine
   /// ```
   @discardableResult
   mutating func removeLastLine() -> Line? {
      guard !lines.isEmpty else {
         return nil // No lines to remove
      }
      
      lastModified = Date()
      return lines.removeLast()
   }
   
   /// Removes all lines from the drawing
   ///
   /// Completely clears the drawing, like starting over.
   /// Similar to your chess Board::reset() method.
   ///
   /// - Warning: This cannot be undone!
   mutating func clearAllLines() {
      lines.removeAll()
      lastModified = Date()
   }
}

// MARK: - Drawing Settings

/// Contains all the current drawing preferences
///
/// This is a separate struct to keep things organized.
/// It holds all the settings that affect how new lines are drawn.
/// Think of it like user preferences in your chess game.
///
/// We use a struct here too because it's just data storage.
struct DrawingSettings {
   
   /// The color currently selected for drawing
   ///
   /// This is the color that will be used for new lines.
   /// When eraser mode is active, this color is ignored.
   var selectedColor: Color = .black
   
   /// How thick new lines should be
   ///
   /// Measured in points (standard iOS unit).
   /// Typical range is 1.0 (very thin) to 10.0 (very thick).
   var selectedThickness: CGFloat = 2.0
   
   /// Which drawing tool is currently active
   ///
   /// Different tools might draw differently (smooth vs textured, etc.)
   /// This enum is defined in your existing ToolName.swift file.
   var selectedTool: SketchTool = .pen
   
   /// Whether the interface should use dark mode
   ///
   /// This affects the UI colors, not the drawing itself.
   /// The drawing canvas stays white regardless.
   var isDarkMode: Bool = false
}

// MARK: - Extensions for Convenience

/// Additional helpful methods for DrawingDocument
///
/// Extensions let you add methods to existing types.
/// This is like adding methods to a C++ class after it's defined,
/// but much cleaner and more organized.
extension DrawingDocument {
   
   /// Creates a summary string about this drawing
   ///
   /// Useful for displaying information about the drawing
   /// in lists or file browsers.
   ///
   /// - Returns: A human-readable description of the drawing
   ///
   /// ## Example Output:
   /// "Drawing with 5 lines, last modified 2 minutes ago"
   var summary: String {
      let lineText = lineCount == 1 ? "1 line" : "\(lineCount) lines"
      return "Drawing with \(lineText), created \(id.uuidString.prefix(8))..."
   }
}
