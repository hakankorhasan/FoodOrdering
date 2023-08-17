//
//  ListOrdersViewController.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 12.08.2023.
//

import UIKit
import ProgressHUD

class ListOrdersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "My Orders"
        ProgressHUD.show()
        registerCells()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchOrders()
    }
    
    private func fetchOrders() {
        NetworkingManager.shared.fetchAllOrders { (result) in
            switch result {
            case .success(let orders):
                ProgressHUD.dismiss()
                self.orders = orders
                self.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.showFailed("\(error.localizedDescription)")
            }
        }
        
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
   
}

extension ListOrdersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
