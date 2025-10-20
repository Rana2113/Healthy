//
//  UIButtonStyleExtension.swift
//  Healthy
//
//  Created by Abdelrahman Zain on 19/10/2025.
//

import Foundation
import UIKit

extension UIButton{
    enum ButtonStyle {
        case primary
        case secondary
    }
}
extension UIButton {
    func applyButtonStyle (_ style : ButtonStyle){
        
        backgroundColor = style.backgroundColor
        titleLabel?.font = style.fontSize
        layer.masksToBounds = true
    }
}


private extension UIButton.ButtonStyle {
    var backgroundColor : UIColor {
        switch self {
        case .primary: return .primary100
            case .secondary: return .white
        }
    }
    
    
    var textColor: UIColor? {
        switch self {
        case .primary: return .white
        case .secondary: return .secondary100
        }
    }

    var fontSize : UIFont {
        return UIFont.systemFont(ofSize: 16, weight: .bold)
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

