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
    /// Optional because these are not set until user allows location services or enters manual location
    private(set) var userLatitude: Double?
    private(set) var userLongitude: Double?
    private(set) var radius: Int?
    
    public var userLocation: CLLocation? {
        let latitude = self.userLatitude ?? 37.77
        let longitude = self.userLongitude ?? 122.42
        return CLLocation(latitude: latitude, longitude: longitude)
    }
        
    // Hold completion handler as global
    var completion: ((CLLocation) -> Void)?
    
    public func getUserLocation(completion: @escaping ((CLLocation)-> Void)) {
        self.completion = completion
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    func setUserRadius(with roundedRadius: Int){
        radius = roundedRadius
        print(radius!)
    }
    
    // How can I call this function in the getUserLocation and setLocationManually functions while inserting the location?
   public func setLocationCoordinates(with location: CLLocation) {
        userLatitude = location.coordinate.latitude
        userLongitude = location.coordinate.longitude
        print(userLatitude!, userLongitude!)
    }
    
    // Reverse Geocode the user input new location name into CLLocation, then call setLocationCoordinates to convert to the Lat/Long that we can add user location as parameter to network calls
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
