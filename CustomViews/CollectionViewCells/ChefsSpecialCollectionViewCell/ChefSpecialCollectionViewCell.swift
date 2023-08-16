//
//  ChefSpecialCollectionViewCell.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 10.08.2023.
//

import UIKit
import Kingfisher

class ChefSpecialCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: ChefSpecialCollectionViewCell.self)

    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var caloriesLabel: UILabel!
    
    func setup(dish: Dish) {
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
        dishImageView.kf.setImage(with: dish.image?.asUrl)
    }
}
