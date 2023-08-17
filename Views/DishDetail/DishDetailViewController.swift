//
//  DishDetailViewController.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 12.08.2023.
//

import UIKit
import Kingfisher
import ProgressHUD

class DishDetailViewController: UIViewController {
    
    
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var caloriesLabel: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       populateView()
    }
    
    private func populateView() {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name
        caloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
    }
    
    @IBAction func placeOrderBtnClicked(_ sender: Any) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            ProgressHUD.showError("Please enter your name")
            return
        }
        
        ProgressHUD.show("Placing Order...")
        NetworkingManager.shared.placeOrder(dishId: dish.id ?? "", name: name) { (result) in
            switch result {
            case .success(_):
                ProgressHUD.showSucceed("Your order has been received.")
            case .failure(let error):
                ProgressHUD.showFailed("\(error.localizedDescription)")
            }
        }
        
    }
    
}

