import SwiftUI

public struct Colors {
    public static let primaryBackgroundColor = Color(resourcePackage: "primaryBackground")
    public static let secondaryBackgroundColor = Color(resourcePackage: "secondaryBackground")
    public static let primaryForegroundColor = Color(resourcePackage: "primaryForeground")
    public static let secondaryForegroundColor = Color(resourcePackage: "secondaryForeground")
    public static let imageBackgroundColor = Color(resourcePackage: "imageBackground")
}

extension Color {
    init(resourcePackage name: String) {
        self.init(name, bundle: .module)
    }
}
