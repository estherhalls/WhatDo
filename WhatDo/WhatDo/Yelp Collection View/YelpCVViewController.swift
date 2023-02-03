//
//  YelpCVViewController.swift
//  WhatDo
//
//  Created by Jacob Perez on 12/29/22.
//

import UIKit
import CoreLocation

class YelpCVViewController: UIViewController, YelpCollectionViewDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var headerView: HeaderLargeView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var categoryHeaderView: CategoryHeaderView!
    @IBOutlet weak var locationLabel: UILabel!
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
    
    // Location Properties
    private let viewModel = LocationManagerViewModel.shared
    
    let sectionHeaders = ["Near By", "Highly Rated", "Affordable"]
    
    var businessListVM: BusinessListVM!
    var businessSearch: BusinessSearch?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showLocationLabel()
        // Header
        if let titleImage = UIImage(named: "whatDoSmall") {
            headerView.configureImageViews(withImages: titleImage, subtitle: nil)
            
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.register(UINib(nibName: "YelpCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "yelpCell")
            setupCollectionViewLayout(collectionView: collectionView)
            collectionView.register(UINib(nibName: "SectionCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerCell")
        }
        if let categoryImage = UIImage(named: "headerDining") {
            categoryHeaderView.configureCategoryHeader(with: "dining", image: categoryImage)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        businessListVM = BusinessListVM(delegate: self)
        businessListVM.yelpSearch()
    }
    // MARK: - Actions
    @IBAction func locationButtonTapped(_ sender: Any) {
        showNewLocationAlert()
    }
    @IBAction func micButtonTapped(_ sender: Any) {
    }
    @IBAction func filterButtonTapped(_ sender: Any) {
    }
    
    // MARK: - Methods
    func setupCollectionViewLayout(collectionView: UICollectionView) {
        // We want the item to take up as much space as it can.
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        // This is representative of the actual cell.
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        // This is an estimation of how much space an item should take up on screen. Roughly 40% of the width and 29% of the height.
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.395), heightDimension: .fractionalHeight(0.29))
        // Groups are collections of items, we only need one item per group.
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem:  item, count: 1)
        // This adds padding between groups.
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4)
        // This section represents one full swimlane.
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(30))
        let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [headerItem]
        let layout = UICollectionViewCompositionalLayout(section: section )
        collectionView.collectionViewLayout = layout
    }
    
    func showNewLocationAlert() {
        
        let alert = UIAlertController(title: "Change Location", message: "Enter a city name or street address below.", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "New Location"
        }
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        let setLocationAction = UIAlertAction(title: "Set Location", style: .default) { _ in
            guard let contentTextField = alert.textFields?.first,
                  let locationName = contentTextField.text else {return}
            self.viewModel.setLocationManually(locationName) { [weak self] location in
                /// Unwrap [weak self]
                guard let strongSelf = self else { return }
                guard let newLocation = location else { return }
                strongSelf.viewModel.setLocationCoordinates(with: newLocation)
                strongSelf.businessListVM = BusinessListVM(delegate: self!)
                strongSelf.businessListVM.yelpSearch()
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                    self?.showLocationLabel()
                }
            }
        }
        alert.addAction(dismissAction)
        alert.addAction(setLocationAction)
        present(alert, animated: true)
    }
    
    func showLocationLabel() {
        
        guard let location = self.viewModel.userLocation else { return }
        
        LocationManagerViewModel.shared.resolveLocationName(with: location) { [weak self] locationName in
            guard let locationName = locationName else {return}
            self?.locationLabel.text = locationName.uppercased()
        }
    }
} // End of Class

extension YelpCVViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func businessesLoadedSuccessfully() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return businessListVM.businessesArray[section].count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return businessListVM.businessesArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "yelpCell", for: indexPath) as! YelpCollectionViewCell
        
        let business = businessListVM.businessesArray[indexPath.section][indexPath.row]
        cell.business = business
        cell.delegate = self
        cell.setupBusinessCell(business: business)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // Check the kind of supplementary view here, it needs to match the kind in your cell registration. Then call collectionView.dequeueReusableSupplementaryView and the rest should be pretty familiar.
        guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerCell", for: indexPath) as? SectionCollectionReusableView else { return UICollectionReusableView() }
        let title = sectionHeaders[indexPath.section]
        cell.setupCategoryTitle(categoryTitle: title)
        return cell
    }
    /*
     // Would use this if label didn't have its own view. More simple.
     func collectionView(_ collectionView: UICollectionView, titleForHeaderInSection section: Int) -> String? {
     return sectionHeaders[section]
     }
     */
}
extension YelpCVViewController: YelpCollectionViewCellDelegate {
    func cellTapped(cell: YelpCollectionViewCell) {
        //        print("Take me there!")
        let storyboard = UIStoryboard(name: "DetailView", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "detailViewVC") as? DetailViewVC {
            guard let data = cell.business else {return}
            vc.sentData = data
            // Initialize the view model of the detail screen
            // Make network call
            // Fetch data to be populated before screen loads
            SearchByIdOrAlias().searchYelpBusinessHours(businessId: data.id!) { result in
                switch result {
                case .success(let businessId):
                    vc.hoursData = businessId
                    print(businessId)
                case .failure(let error):
                    print(error)
                }
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
