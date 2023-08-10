//
//  PopularCollectionViewCell.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 10.08.2023.
//

import UIKit
import Kingfisher

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: PopularCollectionViewCell.self)
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var caloriesLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(dish: Dish) {
        titleLabel.text = dish.title
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
    }
}
