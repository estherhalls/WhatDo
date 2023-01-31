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
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var hoursHeader: UILabel!
    @IBOutlet weak var day0: UILabel!
    @IBOutlet weak var day1: UILabel!
    @IBOutlet weak var day2: UILabel!
    @IBOutlet weak var day3: UILabel!
    @IBOutlet weak var day4: UILabel!
    @IBOutlet weak var day5: UILabel!
    @IBOutlet weak var day6: UILabel!
    @IBOutlet weak var start0: UILabel!
    @IBOutlet weak var start1: UILabel!
    @IBOutlet weak var start2: UILabel!
    @IBOutlet weak var start3: UILabel!
    @IBOutlet weak var start4: UILabel!
    @IBOutlet weak var start5: UILabel!
    @IBOutlet weak var start6: UILabel!
    @IBOutlet weak var end0: UILabel!
    @IBOutlet weak var end1: UILabel!
    @IBOutlet weak var end2: UILabel!
    @IBOutlet weak var end3: UILabel!
    @IBOutlet weak var end4: UILabel!
    @IBOutlet weak var end5: UILabel!
    @IBOutlet weak var end6: UILabel!
    
    
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var businessName: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var sentData: BusinessSearch?  {
        didSet {
            updateViews()
        }
    }
    var hoursData: BusinessByIdForHours? {
        didSet {
            updateViews()
        }
    }
    
//    var hoursData: BusinessByIdOrAlias?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.addMapAnnotationLocation()
            //            self.updateViews()
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
        DispatchQueue.main.async {
            self.loadViewIfNeeded()
            guard let business = self.sentData else { return }
            guard let hoursData = self.hoursData else { return }
            let coordinates = business.coordinates
            let latitude = coordinates.latitude
            let longitude = coordinates.longitude
            // Need a fetchImage network call
            guard let imageUrl = business.imageUrl else { return }
            self.fetchImage(imageString: imageUrl)
            self.businessName.text = business.name
            self.phoneNumber.text = business.displayPhone
            self.ratingLabel.text = "Rating: \(self.sentData?.rating ?? 0.0)"
            self.start0.text =  hoursData.hours?[0].open?[0].start?.timeConverter()
            self.start1.text = hoursData.hours?[0].open?[1].start?.timeConverter()
            self.start2.text = hoursData.hours?[0].open?[2].start?.timeConverter()
            self.start3.text = hoursData.hours?[0].open?[3].start?.timeConverter()
            self.start4.text = hoursData.hours?[0].open?[4].start?.timeConverter()
            self.start5.text = hoursData.hours?[0].open?[5].start?.timeConverter()
            self.start6.text = hoursData.hours?[0].open?[6].start?.timeConverter()
            self.end0.text = hoursData.hours?[0].open?[0].end?.timeConverter()
            self.end1.text = hoursData.hours?[0].open?[1].end?.timeConverter()
            self.end2.text = hoursData.hours?[0].open?[2].end?.timeConverter()
            self.end3.text = hoursData.hours?[0].open?[3].end?.timeConverter()
            self.end4.text = hoursData.hours?[0].open?[4].end?.timeConverter()
            self.end5.text = hoursData.hours?[0].open?[5].end?.timeConverter()
            self.end6.text = hoursData.hours?[0].open?[6].end?.timeConverter()
            
        }
    }
    func fetchImage(imageString: String) {
        
        guard let imageUrl = URL(string: imageString) else { return }
        let request = URLRequest(url: imageUrl)
        APIService().perform(request) { result in
            switch result {
            case .success(let imageData):
                let image = UIImage(data: imageData)
                DispatchQueue.main.async {
                    self.businessImage.image = image
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    @IBAction func callButtonTapped(_ sender: Any) {
        guard let business = sentData else { return }
        guard let number = URL(string: "tel://\(business.phone ?? "No number available.")") else { return }
        UIApplication.shared.open(number)
    }
}

