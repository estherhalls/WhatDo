//
//  DetailViewVC.swift
//  WhatDo
//
//  Created by Jacob Perez on 1/2/23.
//

import UIKit
import MapKit

class DetailViewVC: UIViewController {
    
    @IBOutlet weak var headerView: HeaderLargeView!
    @IBOutlet weak var businessImage: UIImageView!
    @IBOutlet weak var hoursHeader: UILabel!
    @IBOutlet weak var hoursText: UITextView!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var businessName: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    
//    let locationManager = CLLocationManager()
    var sentData: BusinessSearch?  {
        didSet {
            updateViews()
        }
    }
    var businessById: BusinessById?
    let apiService = APIService()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.insertSubview(mapView, at: 0)
        DispatchQueue.main.async {
            self.addMapAnnotationLocation()
        }
       
    }
  
    func addMapAnnotationLocation(){
        guard let business = sentData else {return}
        let coordinates = business.coordinates
        let latitude = coordinates.latitude
        let longitude = coordinates.longitude
        var location = CLLocation(latitude: latitude, longitude: longitude)
        let pin = MKPointAnnotation()
        pin.coordinate = location.coordinate
        // Adjust span so that map is zoomed in closer - can this be variable based on user's set desired travel distance?
        mapView.setRegion(MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)), animated: true)
        mapView.addAnnotation(pin)
    }
    
        func updateViews(){
        loadViewIfNeeded()
            guard let business = sentData else { return }
            let coordinates = business.coordinates
            let latitude = coordinates.latitude
            let longitude = coordinates.longitude
        // Need a fetchImage network call
            businessImage.image = UIImage(named: "\(sentData?.imageUrl)")
            businessName.text = sentData?.name
            
    }
    
    
    @IBAction func callButtonTapped(_ sender: Any) {
    }
}

//extension DetailViewVC : CLLocationManagerDelegate {
//    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
//        if status == .authorizedWhenInUse { // This method gets called when the user responds to the permission dialog. If the user chose Allow, the status becomes CLAuthorizationStatus.AuthorizedWhenInUse
//            locationManager.requestLocation() // Also triggers another requestLocation() because the first attempt would have suffered a permission failure
//        }
//    }
//
////    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { // This gets called when location information comes back. You get an array of locations, but you’re only interested in the first item
////        if let location = locations.first {
////            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
////            let region = MKCoordinateRegion(center: location.coordinate, span: span)
////            mapView.setRegion(region, animated: true)
////            print("location: \(location)")
////        }
////    }
//
//    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
//        print("error: \(NetworkError.requestError)")
//    }
//}
