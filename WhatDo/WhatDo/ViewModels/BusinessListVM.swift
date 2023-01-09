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
    func yelpSearch(latitude: String, longitude: String, radius: String){
        URLCreation().searchYelpRestaurants(userLat: latitude, userLong: longitude, userRadius: radius) { result in
            switch result {
            case .success(let businesses):
                // We need to inform the view controller that the data is ready
                self.businesses = businesses
                self.delegate?.businessesLoadedSuccessfully()
                print(businesses)
            case .failure(let error):
                print(error)
            }
        }
    }
}

