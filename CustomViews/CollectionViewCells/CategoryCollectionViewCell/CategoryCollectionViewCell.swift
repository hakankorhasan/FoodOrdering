//
//  CategoryCollectionViewCell.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 9.08.2023.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    @IBOutlet weak var categoryTitleLBL: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    func setup(categroy: DishCategory) {
        categoryTitleLBL.text = categroy.name
        categoryImageView.kf.setImage(with: categroy.image?.asUrl)
    }
}
