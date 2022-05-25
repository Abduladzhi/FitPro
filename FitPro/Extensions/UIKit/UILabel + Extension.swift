//
//  UILabel + Extension.swift
//  FitPro
//
//  Created by Abduladzhi on 25.05.2022.
//

import Foundation
import UIKit

extension UILabel {
    convenience init(text: String = "") {
        self.init()
        self.text = text
        self.font = .robotoMedium14()
        self.textColor = .specialLightBrown
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
