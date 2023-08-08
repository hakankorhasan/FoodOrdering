//
//  OnboardingCollectionViewCell.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 8.08.2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    
    @IBOutlet weak var slideTitleLabel: UILabel!
    
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.imageView
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
    
}
