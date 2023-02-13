//
//  GetRandomYelpBusiness.swift
//  WhatDo
//
//  Created by Jacob Perez on 2/12/23.
//

import Foundation
import CoreLocation


struct GetRandomYelpBusiness {
    
    var baseURL = "https://api.yelp.com/v3/businesses"
    
    let searchComponent = "search"
    
    func getRandomYelpBusinesses(limit: Int, offset: Int, completion: @escaping (Result<[Business], NetworkError>) -> Void) {
        guard let baseURL = URL(string: baseURL) else {
            completion(.failure(.noData))
            return
        }
        // New URL with search component
        let searchURL = baseURL.appendingPathComponent(searchComponent)
        var urlComponents = URLComponents(url: searchURL, resolvingAgainstBaseURL: true)
        var yelpRequest = URLRequest(url:searchURL)
        // Set request type
        yelpRequest.httpMethod = "GET"
        // Set content type
        yelpRequest.setValue("Bearer O_XTcp-lDmzmsT7RCJjZol43-uCa2nwpK4BjDU1KdNO6MKsrqExwX3g8Niox5RP_wkTsXY3GZIZyEe4pb1xsIBzyaCfvIdPdv_djNnkCCp2YnedmUGm0spCo-eaYY3Yx", forHTTPHeaderField: "Authorization")
        var locationManager = LocationManagerViewModel().manager
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() == true {
            locationManager.startUpdatingLocation()
            let userLocation = locationManager.location?.coordinate
            
            if let userLatitude = userLocation?.latitude, let userLongitude = userLocation?.longitude {
                let parameters = ["term": "restaurant",
                                  "radius": 7000,
                                  "latitude": userLatitude,
                                  "longitude": userLongitude,
                                  "sort_by": "rating",
                                  "categories": "restaurants",
                                  "limit": 3,
                                  "rating": 4.5] as [String : Any]
                
                APIService().perform(yelpRequest) { result in
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(let response):
                        do {
                                       let topLevelDictionary = try response.decode(type: [Business].self)
                                       completion(.success(topLevelDictionary))
                                   } catch {
                                       completion(.failure(.requestError(error)))
                                   }
                               
                    }
                }
            }
        }
    }
}

//{ result in
//   switch result {
//   case .success(let response):
//       if let businesses = response.businesses, businesses.count >= 3 {
//           var selectedBusinesses = [Business]()
//           for business in 0..<3 {
//               let randomIndex = Int.random(in: 0...businesses.count-1)
//               selectedBusinesses.append(businesses[randomIndex])
//           }
//           do {
//               let topLevelDictionary = try response.decode(type: Business.self)
//               completion(.success(topLevelDictionary))
//           } catch {
//               completion(.failure(.requestError(error)))
//           }
//       }
//       completion([])
//   case .failure(let error):
//       print("Error fetching businesses: \(error)")
//       completion([])
//   }
//}
