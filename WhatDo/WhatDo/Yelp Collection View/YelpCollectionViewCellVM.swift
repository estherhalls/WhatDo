//
//  YelpCollectionViewCellVM.swift
//  WhatDo
//
//  Created by Jacob Perez on 1/5/23.
//

import Foundation

struct YelpCollectionViewCellVM {
    
    func convertMetersToMiles(distance: Double) -> Double {
        let distanceInMiles = distance * 0.62137119
        return round(distanceInMiles)
    }
}
