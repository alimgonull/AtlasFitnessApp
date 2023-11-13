//
//  UIView+Extension.swift
//  AtlasFitnessApp
//
//  Created by Alim Gönül on 31.10.2023.
//

import UIKit

extension UIView {
   @IBInspectable var cornerRadius : CGFloat {
        get {return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
