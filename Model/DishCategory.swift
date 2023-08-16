//
//  DishCategory.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 9.08.2023.
//

import UIKit

struct DishCategory: Decodable {
    let id, name, image: String?
    
    //buradaki name json da title diye tanımlı bu yüzden codingkeys ile değişeceğiz
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}
