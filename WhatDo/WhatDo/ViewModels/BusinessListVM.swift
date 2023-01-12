//
//  BusinessListVM.swift
//  WhatDo
//
//  Created by Jacob Perez on 1/2/23.
//

import Foundation
protocol YelpCollectionViewDelegate: YelpCVViewController {
    func businessesLoadedSuccessfully()
}

class BusinessListVM {
    
    // Initialize view model class property
    var viewModel = LocationManagerViewModel()
    let latitude = LocationManagerViewModel.userLatitude!
    let longitude = LocationManagerViewModel.userLongitude!
    let radius = "16000"
    
    var businessesArray: [[BusinessSearch]] = [[]]
    var businesses: [BusinessSearch] = []
    weak var delegate: YelpCollectionViewDelegate?
    init(delegate: YelpCollectionViewDelegate) {
        self.delegate = delegate
    }
    
    func yelpSearch(){
        /// Long and Lat will automatically be set if user allows location services when app launches. If they deny, they will set if user allows location services when on LocationManager scene setting travel distance afteer selecting category, or when they enter a location that isn't their current location. May need to adjust network calls that take in optional lat and long to guard against coordinates being nil in the event user disallows location services at launch.
        URLCreation().searchYelpRestaurants(userLat: "\(latitude)", userLong: "\(longitude)", userRadius: radius) { result in
            switch result {
            case .success(let businesses):
                // We need to inform the view controller that the data is ready
                self.businesses = businesses
                
                let popularRating = businesses.filter { business in
                    return business.rating! >= 4.0
                }
                let nearBy = businesses.filter { business in
                return business.distance! <= 24000
                }
                
                self.businessesArray = [nearBy, popularRating]
                self.delegate?.businessesLoadedSuccessfully()
                print(businesses)
            case .failure(let error):
                print(error)
            }
        }
      

    }
}

