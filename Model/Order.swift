//
//  Order.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 12.08.2023.
//

import UIKit

struct Order: Decodable {
    let id: String?
    let name: String?
    let dish: Dish?
}
