import SwiftUI

protocol TextButtonSize {
    var verticalPadding: CGFloat { get }
    var horizontalPadding: CGFloat { get }
    var minWidth: CGFloat { get }
}

extension TextButtonSize {
    var cornerRadius: CGFloat { 28 }
}

struct LargeTextButtonSize: TextButtonSize {
    public var verticalPadding: CGFloat { 16 }
    public var horizontalPadding: CGFloat { 32 }
    public var minWidth: CGFloat { 120 }
}

struct MediumTextButtonSize: TextButtonSize {
    public var verticalPadding: CGFloat { 12 }
    public var horizontalPadding: CGFloat { 24 }
    public var minWidth: CGFloat { 120 }
}

struct SmallTextButtonSize: TextButtonSize {
    public var verticalPadding: CGFloat { 8 }
    public var horizontalPadding: CGFloat { 16 }
    public var minWidth: CGFloat { 80 }
}
