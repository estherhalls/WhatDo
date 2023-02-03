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
    var viewModel = LocationManagerViewModel.shared
    
    let categoryData = CategoryViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Request Location Services Upon App Launch
        LocationManagerViewModel.shared.getUserLocation { [weak self] location in
            /// Unwrap [weak self]
            guard let strongSelf = self else {return}
            strongSelf.viewModel.setLocationCoordinates(with: location)

        }
        
        // Header
        let subtitleImage = UIImage(named: "subtitle")
        if let titleImage = UIImage(named: "whatDoLarge") {
            homeHeaderView.configureImageViews(withImages: titleImage, subtitle: subtitleImage)
            // Collection View of Categories
            categoryCollectionView.delegate = self
            categoryCollectionView.dataSource = self
            
            categoryCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "categoryCell")
        }
    }
    
} // End of Class

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryData.categories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Return the cell by dequeueing it
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        
        let category = categoryData.categories[indexPath.row]
        
        cell.delegate = self
        cell.configure(with: category)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Return the cell by dequeueing it
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        let storyboard = UIStoryboard(name: "LocationManager", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "locationVC") as! LocationManagerViewController
        // Send cell data to the next view controller
        let category = categoryData.categories[indexPath.row]
        cell.delegate = self
        vc.sentCategory = category
        self.navigationController?.pushViewController(vc, animated: true)
        print("Take me there! \(category)")
    }
}

extension HomeViewController: CollectionViewCellDelegate {
    
    func categoryCellTapped(cell: CollectionViewCell) {
//        let storyboard = UIStoryboard(name: "LocationManager", bundle: nil)
//        if let vc = storyboard.instantiateViewController(withIdentifier: "locationVC") as? LocationManagerViewController {
//            guard let category = cell.category else {return}
//            vc.sentCategory = category
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
//        print("Take me there!")
    }
}


