//
//  UserDefaults+Extensions.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 17.08.2023.
//

import UIKit

extension UserDefaults {
    
    private enum UserDefaultsKeys: String {
        case hasOnboarded
    }
    
    var hasOnboarded: Bool {
        
        get {
            bool(forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
        
        set {
            setValue(newValue, forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
    }
}
