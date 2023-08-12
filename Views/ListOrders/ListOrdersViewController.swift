//
//  ListOrdersViewController.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 12.08.2023.
//

import UIKit

class ListOrdersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = [
        .init(id: "id", name: "hakan", dish: .init(id: "id1", title: "Hakan", description: "Lorem ipsum dolor sit amet", image: "https://picsum.photos/100/200", calories: 34)),
        .init(id: "id", name: "birsu", dish: .init(id: "id1", title: "birsu", description: "Lorem ipsum dolor sit amet", image: "https://picsum.photos/100/200", calories: 34)),
        .init(id: "id", name: "birsu", dish: .init(id: "id1", title: "birsu", description: "Lorem ipsum dolor sit amet", image: "https://picsum.photos/100/200", calories: 34)),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()
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
        present(controller, animated: true)
    }
    
}
