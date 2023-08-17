//
//  HomeViewController.swift
//  FoodOrdering
//
//  Created by Hakan Körhasan on 9.08.2023.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var populerCollectionView: UICollectionView!
    
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    var categories: [DishCategory] = []
    
    var populars: [Dish] = []
    
    var specials: [Dish] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ProgressHUD.show()
        registerCells()
        fetchCategories()
    }
    
    private func fetchCategories() {
        NetworkingManager.shared.fetchAllCategories { [weak self] (result) in
            switch result {
            case .success(let allDishes):
          //      progressHud.dismiss()
                ProgressHUD.dismiss()
                print("successfull")
                
                self?.categories = allDishes.categories ?? []
                self?.populars = allDishes.populars ?? []
                self?.specials = allDishes.specials ?? []
                
                self?.categoryCollectionView.reloadData()
                self?.populerCollectionView.reloadData()
                self?.specialsCollectionView.reloadData()
                
            case .failure(let error):
                //progressHud.textLabel.text = error.localizedDescription
                ProgressHUD.show("\(error.localizedDescription)")
                print("home error is: \(error.localizedDescription)")
            }
        }
    }
    
    //Bu fonksiyonu CategoryCollectionViewCell için açtığımız nib dosyasını tanıtmak için kullanıyoruz
    private func registerCells() {
        
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        populerCollectionView.register(UINib(nibName: PopularCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
        
        specialsCollectionView.register(UINib(nibName: ChefSpecialCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ChefSpecialCollectionViewCell.identifier)
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
        case specialsCollectionView:
            return specials.count
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
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefSpecialCollectionViewCell.identifier, for: indexPath) as! ChefSpecialCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == populerCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
