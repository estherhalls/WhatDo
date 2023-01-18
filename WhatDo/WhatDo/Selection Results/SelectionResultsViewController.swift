//
//  SelectionResultsViewController.swift
//  WhatDo
//
//  Created by Esther on 1/5/23.
//

import UIKit
import MapKit
import CoreLocation

class SelectionResultsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var whatDoHeaderViewSmall: HeaderLargeView!
    
    private let map: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    // Location Properties
    var viewModel = LocationManagerViewModel.shared
//    let setLongitude = LocationManagerViewModel.userLongitude
//    let setLatitude = LocationManagerViewModel.userLatitude
//    let radius = LocationManagerViewModel.radius
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // App Header
        if let titleImage = UIImage(named: "whatDoSmall") {
            whatDoHeaderViewSmall.configureImageViews(withImages: titleImage, subtitle: nil)
        }
        
        // Map
        view.insertSubview(map, at: 0)
        /// Long and Lat will automatically be set if user allows location services when app launches. If they deny, they will set if user allows location services when on LocationManager scene setting travel distance afteer selecting category, or when they enter a location that isn't their current location. May need to adjust network calls that take in optional lat and long to guard against coordinates being nil in the event user disallows location services at launch.
        /// If coordinates have been set, use them
        let longitude = LocationManagerViewModel.shared.userLongitude
        let latitude = LocationManagerViewModel.shared.userLatitude
        if longitude != nil && latitude != nil {
            DispatchQueue.main.async {
                let location = CLLocation(latitude: latitude!, longitude: longitude!)
                self.addMapAnnotationUserLocation(with: location)
            }
        }
        else {
            
        /// call weak self in closure to avoid memory leak
            LocationManagerViewModel.shared.getUserLocation { [weak self] location in
                DispatchQueue.main.async {
                    /// Unwrap [weak self]
                    guard let strongSelf = self else { return }
                    strongSelf.addMapAnnotationUserLocation(with: location)
                }
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        map.frame = view.bounds
    }
    
    // MARK: - Methods
    
    // Map annotation for user current location
    func addMapAnnotationUserLocation(with location: CLLocation){
        let pin = MKPointAnnotation()
        pin.coordinate = location.coordinate
        // Adjust span so that map is zoomed in closer - can this be variable based on user's set desired travel distance?
        map.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025)), animated: true)
        map.addAnnotation(pin)
        
        // Location title shown on navigation bar
        LocationManagerViewModel.shared.resolveLocationName(with: location) { [weak self] locationName in
            self?.title = locationName
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
