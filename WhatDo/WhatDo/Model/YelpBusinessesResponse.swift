//
//  YelpBusinessesResponse.swift
//  WhatDo
//
//  Created by Jacob Perez on 2/13/23.
//

import Foundation

struct YelpBusinessesResponse: Codable {
    let businesses: [Business]
    let total: Int
    let region: Region
}

struct Business: Codable {
    let name: String
    let imageUrl: URL
    let rating: Double
    let reviewCount: Int
    let location: Location
}

struct Location: Codable {
    let address1: String
    let city: String
    let state: String
    let postalCode: String
    let country: String
    let latitude: Double
    let longitude: Double
}

struct Region: Codable {
    let center: Center
}

struct Center: Codable {
    let latitude: Double
    let longitude: Double
}

