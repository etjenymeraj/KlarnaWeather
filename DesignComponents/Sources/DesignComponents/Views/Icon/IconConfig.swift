import SwiftUI

public struct IconConfig {
    public let image: Image
    public let width: Double
    public let height: Double
    public let color: Color?

    public init(
        image: Image,
        width: Double,
        height: Double,
        color: Color? = nil
    ) {
        self.image = image
        self.width = width
        self.height = height
        self.color = color
    }
}
