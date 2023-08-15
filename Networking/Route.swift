//
//  Route.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 15.08.2023.
//

import UIKit

enum Route {
    
    static let baseUrl = "https://yummie.glitch.me"
    
    case temp
    
    var description: String {
        switch self {
        case .temp: return "/temp"
        }
    }
}
