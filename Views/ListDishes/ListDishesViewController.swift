//
//  ListDishesViewController.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 12.08.2023.
//

import UIKit
import ProgressHUD

class ListDishesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategory!
    
    var dishList: [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = category.name
        ProgressHUD.show()
        
        NetworkingManager.shared.fetchCategoryDishes(categoryId: category.id ?? "") { [weak self] (result) in
            
            switch result {
            case .success(let data):
                ProgressHUD.dismiss()
                self?.dishList = data
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.showFailed("\(error.localizedDescription)")
            }
        }
        
        registerCells()
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}

extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dishList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        
        cell.setup(dish: dishList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishList[indexPath.row]
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        navigationController?.pushViewController(controller, animated: true)
    }
}
