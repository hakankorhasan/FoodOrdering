//
//  DishListTableViewCell.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 12.08.2023.
//

import UIKit
import Kingfisher

class DishListTableViewCell: UITableViewCell {

    static let identifier = String(describing: DishListTableViewCell.self)
    
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.title
        descriptionLabel.text = dish.description
    }
    
    func setup(order: Order) {
        dishImageView.kf.setImage(with: order.dish?.image?.asUrl)
        titleLabel.text = order.dish?.title
        descriptionLabel.text = order.name
    }
    
}
