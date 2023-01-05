//
//  HomeViewController.swift
//  WhatDo
//
//  Created by Esther on 12/26/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeHeaderView: HeaderLargeView!
    
    @IBOutlet weak var generateOptionsLabel: UILabel!
    @IBOutlet weak var selectDescriptionLabel: UILabel!
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    
    let categories = [
        "diningCategory",
        "drinkCategory",
        "cinemaCategory",
        "eventCategory",
        "activityCategory",
        "nightOutCategory"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let subtitleImage = UIImage(named: "subtitle")
        if let titleImage = UIImage(named: "whatDoLarge") {
            homeHeaderView.configureImageViews(withImages: titleImage, subtitle: subtitleImage)
            
            categoryCollectionView.delegate = self
            categoryCollectionView.dataSource = self
            
            categoryCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "categoryCell")
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Return the cell by dequeueing it
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        
        //        let cell: CollectionViewCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CollectionViewCell
        
        let category = categories[indexPath.row]
        
        cell.configure(with: category)
//        cell.delegate = self
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /// Display the home view via tab bar controller
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard?.instantiateViewController(withIdentifier: "CategoryRefinementViewController") as? CategoryRefinementViewController
        vc?.sentCategory = categories[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
        print("take me there!")
    }
}

// Conform to CollectionViewCellDelegate
//extension HomeViewController: CollectionViewCellDelegate {
//
//    func categoryButtonTapped(cell: UICollectionViewCell) {
//     guard let categories = categories,
//           let index = collectionView.indexPath(for: cell) else {return}
//
//        /// Display the home view via tab bar controller
//               let storyboard = UIStoryboard(name: "Main", bundle: nil)
//               let homeVC = storyboard.instantiateViewController(withIdentifier: "tabBar")
//
        
//        // You have the cell where the touch event happend, you can get the indexPath like the below
//        guard let indexPath = collectionView.indexPathForSelectedRow,
//                let categoryToSend = self.categories[indexPath.row] else {return}
//
//        //        let indexPath = collectionView.indexPath(for: cell)
//        // Call `performSegue`
//        self.performSegue(withIdentifier: "categoryRefinement", sender: nil)
//    }
//}





