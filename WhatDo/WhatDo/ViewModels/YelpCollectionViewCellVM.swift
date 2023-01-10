//
//  YelpCollectionViewCellVM.swift
//  WhatDo
//
//  Created by Jacob Perez on 1/5/23.
//

import Foundation

struct YelpCollectionViewCellVM {
    
//    public let businessName: String
//    private let miles: Double
//    private let businessImageUrl: URL?
//    
//    init(businessName: String, miles: Double, businessImageUrl: URL?) {
//        self.businessName = businessName
//        self.miles = miles
//        self.businessImageUrl = businessImageUrl
//    }
    
    func convertMetersToMiles(distance: Double) -> Double {
        let distanceInMiles = distance * 0.00621
        return round(distanceInMiles)
    }
//    public var businessStatusText: String {
//        return BusinessSearch.imageUrl.rawValue
//    }
//    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
//        
//        guard let url = businessImageUrl else {
//            completion(.failure(URLError(.badURL)))
//            return
//        }
//        let request = URLRequest(url: url)
//        let task = URLSession.shared.dataTask(with: request) { data, _, error in
//            guard let data = data, error == nil else {
//                completion(.failure(error ?? URLError(.badServerResponse)))
//                return
//            }
//            completion(.success(data))
//        }
//        task.resume()
//    }
}
