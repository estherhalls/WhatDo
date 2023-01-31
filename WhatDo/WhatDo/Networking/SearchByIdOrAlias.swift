//
//  SearchByIdOrAlias.swift
//  WhatDo
//
//  Created by Jacob Perez on 1/19/23.
//

import Foundation

struct SearchByIdOrAlias {
    
    var baseURL = "https://api.yelp.com/v3/businesses"
    
    func searchYelpBusinessHours(businessId: String, completion: @escaping (Result<BusinessByIdForHours, NetworkError>) -> Void) {
        // Create URL object from baseURL
        guard let baseURL = URL(string: baseURL) else {
            completion(.failure(.noData))
            return
        }
        // New URL with search component
        let idURL = baseURL.appendingPathComponent(businessId)
        
        // Create final URL
        let finalURL = idURL
        print(finalURL)
        
        var yelpRequest = URLRequest(url:finalURL)
        // Set request type
        yelpRequest.httpMethod = "GET"
        // Set content type
        yelpRequest.setValue("Bearer O_XTcp-lDmzmsT7RCJjZol43-uCa2nwpK4BjDU1KdNO6MKsrqExwX3g8Niox5RP_wkTsXY3GZIZyEe4pb1xsIBzyaCfvIdPdv_djNnkCCp2YnedmUGm0spCo-eaYY3Yx", forHTTPHeaderField: "Authorization")
        APIService().perform(yelpRequest) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                do {
                    let topLevelDictionary = try data.decode(type: BusinessByIdForHours.self)
                    completion(.success(topLevelDictionary))
                } catch {
                    completion(.failure(.requestError(error)))
                }
            }
        }
    }
}
