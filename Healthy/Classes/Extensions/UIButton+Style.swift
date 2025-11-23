import Foundation
import UIKit

extension UIButton {
    enum ButtonStyle {
        case primary
        case secondary
    }
}
extension UIButton {
    func applyButtonStyle(_ style: ButtonStyle) {
        backgroundColor = style.backgroundColor
        titleLabel?.font = style.fontSize
        layer.masksToBounds = true
        backgroundColor = style.backgroundColor
        titleLabel?.font = style.fontSize
        tintColor = style.textColor
        layer.cornerRadius = style.cornerRadius
        let heightConstraint = heightAnchor.constraint(equalToConstant: style.defaultHeight)
        heightConstraint.priority = .defaultHigh
        heightConstraint.isActive = true
    }
}

private extension UIButton.ButtonStyle {
    var backgroundColor: UIColor {
        switch self {
        case .primary:
            return .primary100
        case .secondary:
            return .white
        }
    }

    var textColor: UIColor? {
        switch self {
        case .primary: return .white
        case .secondary: return .secondary100
        }
    }

    var fontSize: UIFont {
        switch self {
        case .primary: return .mediumBold
        case .secondary: return .mediumBold
        }
    }

    var defaultHeight: CGFloat {
        switch self {
        case .primary, .secondary:
            return 40.0
        }
    }

    var cornerRadius: CGFloat {
        switch self {
        case .primary, .secondary:
            return 12.0
        }
    }
}
