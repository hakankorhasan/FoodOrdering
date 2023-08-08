//
//  UIView+Extensions.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 8.08.2023.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
