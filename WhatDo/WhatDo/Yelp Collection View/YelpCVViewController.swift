//
//  YelpCVViewController.swift
//  WhatDo
//
//  Created by Jacob Perez on 12/29/22.
//

import UIKit

class YelpCVViewController: UIViewController, YelpCollectionViewDelegate {
    
// MARK: - Outlets
    @IBOutlet weak var headerView: HeaderLargeView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var labelBackground: UIView!
    @IBOutlet weak var categoryHeaderLabel: UILabel!
    @IBOutlet weak var categoryHeaderImage: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var micButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    
    // MARK: - Properties
    let categoryHeaderImages = [
        "headerActivity",
        "headerDining",
        "headerEvent",
        "headerCinema"
        ]
    
    var businessListVM: BusinessListVM!
    var businessSearch: BusinessSearch?
    var categories: [CDYelpCategory]?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Header
        if let titleImage = UIImage(named: "whatDoSmall") {
            headerView.configureImageViews(withImages: titleImage, subtitle: nil)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "YelpCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "yelpCell")
        setupCollectionViewLayout(collectionView: collectionView)
        collectionView.register(UINib(nibName: "HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerCell")
        labelBackground.backgroundColor = .gray
//        categoryHeaderImage.image = categoryHeaderImages
        }
         
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        businessListVM = BusinessListVM(delegate: self)
        businessListVM.yelpSearch()
    }
    
    @IBAction func micButtonTapped(_ sender: Any) {
    }
    @IBAction func filterButtonTapped(_ sender: Any) {
    }
    
    func setupCollectionViewLayout(collectionView: UICollectionView) {
        // We want the item to take up as much space as it can.
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        // This is representative of the actual cell.
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        // This is an estimation of how much space an item should take up on screen. Roughly 35% of the width and 20% of the height.
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.42), heightDimension: .fractionalHeight(0.37))
        // Groups are collections of items, we only need one item per group.
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem:  item, count: 1)
        // This adds padding between groups.
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4)
        // This section represents one full swimlane.
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
        let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [headerItem]
        let layout = UICollectionViewCompositionalLayout(section: section )
        collectionView.collectionViewLayout = layout
    }
}
extension YelpCVViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func businessesLoadedSuccessfully() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return businessListVM.businessesArray[section].count
//        return businessListVM.businesses.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return businessListVM.businessesArray.count
//        return businessListVM.businesses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "yelpCell", for: indexPath) as! YelpCollectionViewCell
            
        let business = businessListVM.businesses[indexPath.row]
        cell.business = business
        cell.delegate = self
        cell.setupBusinessCell(business: business)
        
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // Check the kind of supplementary view here, it needs to match the kind in your cell registration. Then call collectionView.dequeueReusableSupplementaryView and the rest should be pretty familiar.
        guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerCell", for: indexPath) as? HeaderCollectionReusableView else { return UICollectionReusableView() }

        //        let category = categoryHeaderImages[indexPath.section]
        //
        //        cell.configure(with: category)
        //
        //        return cell
        //    }

//        let category = businessListVM.businessesArray[indexPath.section]
//        cell.category
        return cell
    }
}


extension YelpCVViewController: YelpCollectionViewCellDelegate {
    func cellTapped(cell: YelpCollectionViewCell) {
//        print("Take me there!")
        let storyboard = UIStoryboard(name: "DetailView", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "detailViewVC") as? DetailViewVC {
            guard let data = cell.business else {return}
            vc.sentData = data
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
