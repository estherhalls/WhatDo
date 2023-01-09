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
        
        let category = categories[indexPath.row]
        
        cell.delegate = self
        cell.configure(with: category)
        
        return cell
    }
}

extension HomeViewController: CollectionViewCellDelegate {
    
    func categoryCellTapped(cell: CollectionViewCell) {
        
        let storyboard = UIStoryboard(name: "CategoryRefinement", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "categoryRefinement") as? CategoryRefinementViewController {
            guard let category = cell.category else {return}
            vc.sentCategory = category
            self.navigationController?.pushViewController(vc, animated: true)
        }
        //        self.inputViewController?.performSegue(withIdentifier: "toRefinementVC", sender: AnyObject.self)
        print("Take me there!")
    }
    
    
    
}




