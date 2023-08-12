//
//  UIViewController+Extensions.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 12.08.2023.
//

import UIKit

extension UIViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        return storyboard.instantiateViewController(identifier: identifier) as! Self
    }
}
