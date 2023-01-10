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
    
    // Instance of CLLocationManager
    let manager = CLLocationManager()
    
    // User's current or set location to be used in network calls. CLLocation must be converted to lat/long which are input as individual String parameters in network calls
    static var userLatitude: Double?
    static var userLongitude: Double?
    static var radius: String?
    
    // Hold completion handler as global
    var completion: ((CLLocation) -> Void)?
    
    public func getUserLocation(completion: @escaping ((CLLocation)-> Void)) {
        self.completion = completion
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    public func setLocationCoordinates(with location: CLLocation) {
        LocationManagerViewModel.userLatitude = location.coordinate.latitude
        LocationManagerViewModel.userLongitude = location.coordinate.longitude
    }
    
    public func setLocationManually(_ newLocation: String, completion: @escaping ((CLLocation?)-> Void)) {
        CLGeocoder().geocodeAddressString(newLocation) { placemarks, error in
            if error != nil {
                print("error: \(error as Optional)")
            } else {
                if let placemark = placemarks?.first,
                   let coord = placemark.location?.coordinate {
                    return completion(CLLocation(latitude: coord.latitude, longitude: coord.longitude))
                }
            }
            return completion(nil)
        }
    }
        
    // Reverse Geocode the user's location to return the Lat/Long of it that we can add user location as parameter to network calls
    
    
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
    
    // implementing CLLocationManagerDelegate - delegate is assigned in getUserLocation function, and this will automatically trigger when the condition occurs
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        completion?(location)
        manager.stopUpdatingLocation()
    }
    
    
} // End of Class
