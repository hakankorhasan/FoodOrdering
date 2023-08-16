//
//  AllDishes.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 16.08.2023.
//

import UIKit

struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let specials: [Dish]?
    let populars: [Dish]?
}
