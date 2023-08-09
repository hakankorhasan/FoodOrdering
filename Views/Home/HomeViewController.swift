//
//  HomeViewController.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 9.08.2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "name 1", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "name 2", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "name 3", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "name 4", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "name 5", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "name 6", image: "https://picsum.photos/100/200"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()
    }
    
    //Bu fonksiyonu CategoryCollectionViewCell için açtığımız nib dosyasını tanıtmak için kullanıyoruz
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        
        cell.setup(categroy: categories[indexPath.row])
        
        return cell
    }
}
