//
//  DetailViewVM.swift
//  WhatDo
//
//  Created by Jacob Perez on 1/2/23.
//

import UIKit
//import Combine

class DetailViewVM {

    var viewModel = LocationManagerViewModel()
    let latitude = LocationManagerViewModel.userLatitude!
    let longitude = LocationManagerViewModel.userLongitude!
    let radius = "16000"
    
    var businessById: BusinessByIdOrAlias
    var businessHours: [Hours] = []
    
    init(businessById: BusinessByIdOrAlias, businessHoursArray: [Hours] = []) {
        self.businessById = businessById
        self.businessHours = businessHoursArray
    }
    func fetchHours() {

        SearchByIdOrAlias().searchYelpBusinessHours(businessId: "\(businessById)") { result in
                switch result {
                case .success(let businesses):
                    // We need to inform the view controller that the data is ready
                    self.businessById = businesses
                    print(businesses)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
