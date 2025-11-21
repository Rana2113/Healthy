//
//  CheckboxButton.swift
//  Healthy
//
//  Created by MacOS on 21/11/2025.
//

import Foundation
import UIKit

class CheckboxButton: UIButton {
    
    var isChecked: Bool = false {
        didSet {
            let image = isChecked ? Images.iconCheckboxSelected.image : Images.iconCheckboxNotSelected.image
            self.setImage(image, for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    @objc private func buttonClicked(sender: UIButton) {
        isChecked.toggle()
    }

}
