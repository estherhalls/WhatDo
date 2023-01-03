//
//  Business.swift
//  WhatDo
//
//  Created by Jacob Perez on 1/2/23.
//

import Foundation
// Top level dictionary Model

struct TopLevelDictionary: Decodable {
    let businesses: [BusinessSearch]
}

// Yelp Business Search Model
struct BusinessSearch: Decodable {
    
    let categories: [CDYelpCategory]?
    let coordinates: CDYelpCoordinates
    let displayPhone: String?
    let distance: Double?
    let id: String?
    let alias: String?
    let imageUrl: String?
    let isClosed: Bool?
    let name: String?
    let phone: String?
    let price: String?
    let rating: Double?
    let reviewCount: Int?
    let url: String?
    let transactions: [String]?
}
    enum CodingKeys: String, CodingKey {
        case categories
        case coordinates
        case displayPhone = "display_phone"
        case distance
        case id
        case alias
        case imageUrl = "image_url"
        case isClosed = "is_closed"
        case name
        case phone
        case price
        case rating
        case reviewCount = "review_count"
        case url
        case transactions
    }

struct CDYelpCategory: Decodable {
    
    let alias: String?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case alias
        case title
    }
    
    struct Detailed: Decodable {
        let alias: String?
        let title: String?
        let parentAliases: [String]?
        
        enum CodingKeys: String, CodingKey {
            case alias
            case title
            case parentAliases = "parent_aliases"
        }
    }
}
struct CDYelpCoordinates: Decodable {
    let latitude: Double
    let longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }
}
