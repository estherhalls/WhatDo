//
//  LocationManagerViewController.swift
//  WhatDo
//
//  Created by Esther on 1/9/23.
//

import UIKit
import CoreLocation

// User Lat and Long should be set here by confirming location services/setting new location. Lat and long are parameters passed to Yelp network calls. Slider sets radius from user location (will need to convert miles on user end to meters for yelp network call). Can manual location set override current? They should probably just both lead to setting location lat/long and whichever they choose will override because it is the latest to set those variables
class LocationManagerViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var headerView: HeaderLargeView!
    
    
    // Reciever Property - Selected Category Sent Data
    var sentCategory: String?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // App Header
        if let titleImage = UIImage(named: "whatDoSmall") {
            headerView.configureImageViews(withImages: titleImage, subtitle: nil)
        }
    }
    
    // MARK: - Methods
    func setLocationCoordinates(with location: CLLocation) {
        LocationManagerViewModel.userLatitude = location.coordinate.latitude
        LocationManagerViewModel.userLongitude = location.coordinate.longitude
     
    }
    
    // MARK: - Navigation
    @IBAction func setLocationTapped(_ sender: Any) {
        // Alert that allows user to use current location or set a location manually
        LocationManagerViewModel.shared.getUserLocation { [weak self] location in
            /// Unwrap [weak self]
            guard let strongSelf = self else { return }
            strongSelf.setLocationCoordinates(with: location)
            print(LocationManagerViewModel.userLatitude, LocationManagerViewModel.userLongitude)
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "CategoryRefinement", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "categoryRefinement") as? CategoryRefinementViewController {
            guard let category = sentCategory else { return }
            vc.sentCategory = category
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        print("Take me there!")
    }
 
}
