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
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.insertSubview(map, at: 0)
        // Map - call weak self in closure to avoid memory leak
        LocationManagerViewModel.shared.getUserLocation { [weak self] location in
            DispatchQueue.main.async {
                /// Unwrap [weak self]
                guard let strongSelf = self else { return }
                strongSelf.addMapAnnotationUserLocation(with: location)
            }
        }
        
        // App Header
        if let titleImage = UIImage(named: "whatDoSmall") {
            whatDoHeaderViewSmall.configureImageViews(withImages: titleImage, subtitle: nil)
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
        map.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)), animated: true)
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
