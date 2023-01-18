//
//  SetCoordinates.swift
//  WhatDo
//
//  Created by Esther on 1/15/23.
//

import Foundation

struct SetCoordinates {
    
    var viewModel = LocationManagerViewModel()
    // User's current or set location to be used in network calls. CLLocation must be converted to lat/long which are input as individual String parameters in network calls
    static var latitude: Double?
    static var longitude: Double?
    static var radius: String?
}
