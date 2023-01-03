//
//  YelpCVViewController.swift
//  WhatDo
//
//  Created by Jacob Perez on 12/29/22.
//

import UIKit

class YelpCVViewController: UIViewController {

    @IBOutlet weak var headerView: HeaderLargeView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var labelBackground: UIView!
    @IBOutlet weak var categoryHeaderLabel: UILabel!
    @IBOutlet weak var categoryHeaderImage: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var micButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    
    let categories = [
        "diningCategory",
        "drinkCategory",
        "cinemaCategory",
        "eventCategory",
        "activityCategory",
        "Unknown"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let titleImage = UIImage(named: "whatDoSmall") {
            headerView.configureImageViews(withImages: titleImage, subtitle: nil)
        }
        collectionView.register(UINib(nibName: "YelpCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "yelpCell")
        collectionView.dataSource = self
        setupCollectionViewLayout(collectionView: collectionView)
        collectionView.register(UINib(nibName: "HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerCell")
        labelBackground.backgroundColor = .gray
        BusinessListVM().yelpSearch()
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
extension YelpCVViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "yelpCell", for: indexPath) as? YelpCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setup()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // Check the kind of supplementary view here, it needs to match the kind in your cell registration. Then call collectionView.dequeueReusableSupplementaryView and the rest should be pretty familiar.
        guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerCell", for: indexPath) as? HeaderCollectionReusableView else {
            return UICollectionReusableView()
        }
        cell.setup()
            return cell
    }
}
