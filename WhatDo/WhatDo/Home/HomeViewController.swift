//
//  HomeViewController.swift
//  WhatDo
//
//  Created by Esther on 12/26/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var homeHeaderView: HeaderLargeView!
    @IBOutlet weak var generateOptionsLabel: UILabel!
    @IBOutlet weak var selectDescriptionLabel: UILabel!
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    // Initialize view model class property
    var viewModel = LocationManagerViewModel()
    
    let categories = [
        "diningCategory",
        "drinkCategory",
        "cinemaCategory",
        "eventCategory",
        "activityCategory",
        "nightOutCategory"
    ]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Header
        let subtitleImage = UIImage(named: "subtitle")
        if let titleImage = UIImage(named: "whatDoLarge") {
            homeHeaderView.configureImageViews(withImages: titleImage, subtitle: subtitleImage)
            // Collection View of Categories
            categoryCollectionView.delegate = self
            categoryCollectionView.dataSource = self
            
            categoryCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "categoryCell")
        }
        
//        // Request Location Services Upon App Launch
//
//        // Alert that allows user to use current location or set a location manually
//        LocationManagerViewModel.shared.getUserLocation { [weak self] location in
//            /// Unwrap [weak self]
//            guard let strongSelf = self else {return}
//            strongSelf.viewModel.setLocationCoordinates(with: location)
//        }
    }
} // End of Class

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
        
        let storyboard = UIStoryboard(name: "LocationManager", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "locationVC") as? LocationManagerViewController {
            guard let category = cell.category else {return}
            vc.sentCategory = category
            self.navigationController?.pushViewController(vc, animated: true)
        }
    
        print("Take me there!")
    }
    
    
    
}




