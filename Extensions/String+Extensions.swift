//
//  String+Extensions.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 9.08.2023.
//

import UIKit

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
