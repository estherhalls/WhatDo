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
        "activityCategory"
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
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Return the cell by dequeueing it
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        let category = categories[indexPath.row]
        
        cell.configure(with: category)
        
        return cell
    }
}
