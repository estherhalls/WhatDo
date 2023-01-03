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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func configure( with business: BusinessSearch, and image: UIImage?) {
        loadViewIfNeeded()
        if let image {
           businessImage.image = image
        }
        businessName.text = business.name
        }
    
    @IBAction func callButtonTapped(_ sender: Any) {
    }
}
