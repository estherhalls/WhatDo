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
    // Call Function
    // A way for BusinessListVM to let the view controller to know that there is data to be displayed
//    let latValue = "21.27702694074651"
//    let longValue = "-157.81304640731193"
//    let radius = "8000"
    // When has this yelp function completed
//    func yelpSearch(latitude: String, longitude: String, radius: String){
    
    func yelpSearch(){

        URLCreation().searchYelpRestaurants(userLat: "\(String(describing: latitude))", userLong: "\(longitude)", userRadius: radius) { result in
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

