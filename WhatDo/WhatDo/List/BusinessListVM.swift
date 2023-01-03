//
//  BusinessListVM.swift
//  WhatDo
//
//  Created by Jacob Perez on 1/2/23.
//

import Foundation
class BusinessListVM {
    var businesses: [BusinessSearch] = []
    
    // Call Function
    
    let latValue = "21.27702694074651"
    let longValue = "-157.81304640731193"
    let radius = "8000"
    
    func yelpSearch(){
        URLCreation().searchYelpRestaurants(userLat: latValue, userLong: longValue, userRadius: radius) { result in
            switch result {
            case .success(let businesses):
                print(businesses)
            case .failure(let error):
                print(error)
            }
        }
    }
}

