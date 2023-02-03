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
    var viewModel = LocationManagerViewModel.shared
    let latitude = LocationManagerViewModel.shared.userLatitude ?? 37.77
    let longitude = LocationManagerViewModel.shared.userLongitude ?? 122.42
    let radius = "16000"
    
    var businessesArray: [[BusinessSearch]] = [[]]
   
    weak var delegate: YelpCollectionViewDelegate?
    init(delegate: YelpCollectionViewDelegate) {
        self.delegate = delegate
    }
    
    func yelpSearch(){
        
        SearchBusinesses().searchYelpRestaurants(userLat: "\(latitude)", userLong: "\(longitude)", userRadius: radius) { result in
            switch result {
            case .success(let businesses):
                // We need to inform the view controller that the data is ready
                
                let popularRating = businesses.filter { business in
                    return business.rating! >= 4.5
                }
                let nearBy = businesses.filter { business in
                    return business.distance! <= 7000
                }
                let nonNilBusinessPrice = businesses.filter { business in
                    return business.price != nil
                }
                let updateMe = nonNilBusinessPrice.filter { business in
                    return business.price == "$$"
                }
                self.businessesArray = [nearBy, popularRating, updateMe]
                self.delegate?.businessesLoadedSuccessfully()
                print(self.latitude, self.longitude)
            case .failure(let error):
                print(error)
            }
        }
    }
}

