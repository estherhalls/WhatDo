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
    
    // Location Properties
    var viewModel = LocationManagerViewModel.shared
    let longitude = LocationManagerViewModel.shared.userLongitude
    let latitude = LocationManagerViewModel.shared.userLatitude
    
    let sectionHeaders = ["This", "That"]
    
    var businessListVM: BusinessListVM!
    var businessSearch: BusinessSearch?
    //    var categories: [CDYelpCategory]?
    
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
    // MARK: - Methods
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
    
    func showNewLocationAlert() {
        let secondAlert = UIAlertController(title: "New Starting Location", message: "Enter a city name or street address below.", preferredStyle: .alert)
        secondAlert.addTextField { textField in
            textField.placeholder = "New Location"
        }
        
        let dismissAction = UIAlertAction(title: "Back To Home", style: .cancel) { _ in
            // Navigate back to Home if declining to enter location
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            let homeVC = storyboard.instantiateViewController(withIdentifier: "homeNav")
            /// This is to get the SceneDelegate object from your view controller
            /// then call the change root view controller function to change to main tab bar
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(homeVC)
        }
        
        let setLocationAction = UIAlertAction(title: "Set Location", style: .default) { _ in
            guard let contentTextField = secondAlert.textFields?.first,
                  let locationName = contentTextField.text else {return}
            self.viewModel.setLocationManually(locationName) { [weak self] location in
                /// Unwrap [weak self]
                guard let strongSelf = self else { return }
                guard let newLocation = location else { return }
                strongSelf.viewModel.setLocationCoordinates(with: newLocation)
            }
        }
        secondAlert.addAction(dismissAction)
        secondAlert.addAction(setLocationAction)
        present(secondAlert, animated: true)
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
        //        return businessListVM.businesses.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //        categoryHeaderLabel.text = section.sections
        return businessListVM.businessesArray.count
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
        //                cell.configure(with: category)
        //
        //        return cell
        //    }
        
        //        let category = businessListVM.businessesArray[indexPath.section]
        //        cell.category
        return cell
    }
    //       func collectionView(_ collectionView: UICollectionView, titleForHeaderInSection section: Int) -> String? {
    //           guard sectionHeaders.indices ~= section else {
    //               print("No section title for this section")
    //               return nil
    //           }
    //
    //           return sectionHeaders[section]
    //       }
    //    func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath {
    //        guard sectionHeaders.indices ~= index else {
    //                   print("No section title for this section")
    //                   return
    //               }
    //        return sectionHeaders[index]
    //    }
}
extension YelpCVViewController: YelpCollectionViewCellDelegate {
    func cellTapped(cell: YelpCollectionViewCell) {
        //        print("Take me there!")
        let storyboard = UIStoryboard(name: "DetailView", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "detailViewVC") as? DetailViewVC {
            guard let data = cell.business else {return}
            vc.sentData = data
            // Initialize the view model of the detail screen
            //            DetailViewVM().businessHours
            // Make network call
            // fetch data to be populated before screen loads
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
