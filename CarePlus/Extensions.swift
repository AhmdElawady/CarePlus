//
//  Extensions.swift
//  CarePlus
//
//  Created by Awady on 1/15/20.
//  Copyright © 2020 Awady. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func setImageTintColor(_ color: UIColor) {
        let tintedImage = self.imageView?.image?.withRenderingMode(.alwaysTemplate)
        self.setImage(tintedImage, for: .normal)
        self.tintColor = color
    }
}

class genarics {
    var instance = genarics()
    enum SelectedService {
        case medical
        case health
    }
    
}

