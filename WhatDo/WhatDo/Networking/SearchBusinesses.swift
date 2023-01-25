//
//  URLCreation.swift
//  WhatDo
//
//  Created by Jacob Perez on 1/2/23.
//

import Foundation

class SearchBusinesses {
    // URL Creation and Call
    var baseURL = "https://api.yelp.com/v3/businesses"
    /// Radius is int in meters. 8000 meters is about 5 miles
    let searchComponent = "search"
    let searchTermKey = "term"
    var searchTermValue = "restaurants"
    let radiusKey = "radius"
    let latKey = "latitude"
    let longKey = "longitude"
    
    func searchYelpRestaurants(userLat: String, userLong: String, userRadius: String, completion: @escaping (Result<[BusinessSearch], NetworkError>) -> Void) {
        // Create URL object from baseURL
        guard let baseURL = URL(string: baseURL) else {
            completion(.failure(.noData))
            return
        }
        // New URL with search component
        let searchURL = baseURL.appendingPathComponent(searchComponent)
        // Add URLComponents object to append query items
        var urlComponents = URLComponents(url: searchURL, resolvingAgainstBaseURL: true)
        // Create query items
        var searchQueryItem = URLQueryItem(name: searchTermKey, value: searchTermValue)
        var latQueryItem = URLQueryItem(name: latKey, value: userLat)
        var longQueryItem = URLQueryItem(name: longKey, value: userLong)
        var radiusQueryItem = URLQueryItem(name: radiusKey, value: userRadius)
        // Add URLQueryItems to URLComponents struct
        urlComponents?.queryItems = [searchQueryItem, latQueryItem, longQueryItem, radiusQueryItem]
        
        // Create final URL, unwrapped
        guard let finalURL = urlComponents?.url else { return }
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
                    let topLevelDictionary = try data.decode(type: TopLevelDictionary.self)
                    completion(.success(topLevelDictionary.businesses))
                } catch {
                    completion(.failure(.requestError(error)))
                }
            }
        }
    }

}

