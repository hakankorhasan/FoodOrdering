//
//  Dish.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 10.08.2023.
//

import UIKit

struct Dish: Decodable {
    let id, name, description, image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return String("\(calories ?? 0) calories" )
    }
}
