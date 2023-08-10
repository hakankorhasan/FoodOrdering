//
//  HomeViewController.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 9.08.2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var populerCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
        .init(id: "id1", name: "name 1", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "name 2", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "name 3", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "name 4", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "name 5", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "name 6", image: "https://picsum.photos/100/200"),
    ]
    
    var populars: [Dish] = [
        .init(id: "id1", title: "Hakan", description: "Bursanın en güzel, gözde yemeklerin mekanı...", image: "https://picsum.photos/100/200", calories: 34),
        .init(id: "id1", title: "Birsu", description: "Bursanın en güzel, gözde yemeklerin mekanı...", image: "https://picsum.photos/100/200", calories: 340),
        .init(id: "id1", title: "Ahmet", description: "Bursanın en güzel, gözde yemeklerin mekanı...", image: "https://picsum.photos/100/200", calories: 150),
        .init(id: "id1", title: "Enes", description: "Bursanın en güzel, gözde yemeklerin mekanı...", image: "https://picsum.photos/100/200", calories: 180),
        .init(id: "id1", title: "Burak", description: "Bursanın en güzel, gözde yemeklerin mekanı...", image: "https://picsum.photos/100/200", calories: 600),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()
    }
    
    //Bu fonksiyonu CategoryCollectionViewCell için açtığımız nib dosyasını tanıtmak için kullanıyoruz
    private func registerCells() {
        
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        populerCollectionView.register(UINib(nibName: PopularCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //swicth - case
        switch collectionView {
        case populerCollectionView:
            return populars.count
        case categoryCollectionView:
            return categories.count
        default: return 0
        }
    
       /*
        if section ==  0 {
           return categories.count
        } else if section == 1 {
           return populars.count
        } else { return 0 }
        */
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        
        switch collectionView {
        case populerCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as! PopularCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(categroy: categories[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    
    }
}
