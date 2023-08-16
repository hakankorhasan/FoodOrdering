//
//  ListDishesViewController.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 12.08.2023.
//

import UIKit

class ListDishesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategory!
    
    var dishList: [Dish] = [
        .init(id: "id1", name: "Hakan", description: "Lorem ipsum dolor sit amet", image: "https://picsum.photos/100/200", calories: 34),
        .init(id: "id1", name: "Birsu", description: "Bursanın en güzel, gözde yemeklerin mekanı...", image: "https://picsum.photos/100/200", calories: 340),
        .init(id: "id1", name: "Ahmet", description: "Bursanın en güzel, gözde yemeklerin mekanı...", image: "https://picsum.photos/100/200", calories: 150),
        .init(id: "id1", name: "Enes", description: "Bursanın en güzel, gözde yemeklerin mekanı...", image: "https://picsum.photos/100/200", calories: 180),
        .init(id: "id1", name: "Burak", description: "Bursanın en güzel, gözde yemeklerin mekanı...", image: "https://picsum.photos/100/200", calories: 600),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = category.name
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
      //  controller.modalPresentationStyle = .fullScreen
      //  controller.modalTransitionStyle = .coverVertical
        navigationController?.present(controller, animated: true)
    }
}
