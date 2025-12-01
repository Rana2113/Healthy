import UIKit

// MARK: TextField Style

extension UITextField {
    enum TextFieldStyle {
        case primary
    }
}
// MARK: ApplyTextField Style

extension UITextField {
    func applyTextFieldStyle(_ style: TextFieldStyle){
        NSLayoutConstraint.activate([
        heightAnchor.constraint(equalToConstant: Constants.height)
        ])
        layer.cornerRadius = Constants.cornerRedius
        layer.borderWidth = Constants.borderWidth
        layer.borderColor = UIColor.gray4.cgColor
        borderStyle = .none
    }
}

// MARK: Constants

private extension UITextField {
    enum Constants {
        static let height: CGFloat = 55.0
        static let cornerRedius: CGFloat = 10.0
        static let borderWidth: CGFloat = 1.0
        
    }
}
