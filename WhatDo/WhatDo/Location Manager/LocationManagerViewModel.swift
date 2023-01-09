//
//  LocationManager.swift
//  WhatDo
//
//  Created by Esther on 1/9/23.
//

import Foundation
import CoreLocation

class LocationManagerViewModel: NSObject, CLLocationManagerDelegate {
    
    // Singleton
    static let shared = LocationManagerViewModel()
    
    let manager = CLLocationManager()
    
    // Hold completion handler as global
    var completion: ((CLLocation) -> Void)?
    
    public func getUserLocation(completion: @escaping ((CLLocation)-> Void)) {
        self.completion = completion
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    // Reverse Geocode the user's location to return the name of it that we can add to a label, etc.
    public func resolveLocationName(with location: CLLocation, completion: @escaping ((String?) -> Void)) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location, preferredLocale: .current) { placemarks, error in
            guard let place = placemarks?.first, error == nil else {
                completion(nil)
                return
            }
            /// See all options available from place.
            print (place)
            
            var name = ""
            
            if let locality = place.locality {
                name += locality
            }
            
            if let adminRegion = place.administrativeArea {
                name += ", \(adminRegion)"
            }
            completion(name)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        completion?(location)
        manager.stopUpdatingLocation()
    }
    
    
} // End of Class
