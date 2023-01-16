//
//  LocationManagerViewController.swift
//  WhatDo
//
//  Created by Esther on 1/9/23.
//

import UIKit
import CoreLocation

/// User Lat and Long should be set here by confirming location services/setting new location. Lat and long are parameters passed to Yelp network calls. Slider sets radius from user location (will need to convert miles on user end to meters for yelp network call). Can manual location set override current? They should probably just both lead to setting location lat/long and whichever they choose will override because it is the latest to set those variables
class LocationManagerViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var headerView: HeaderLargeView!
    @IBOutlet weak var travelDistanceSlider: UISlider!
    @IBOutlet weak var travelRadiusMilesLabel: UILabel!
    
    // Initialize view model class property
    var viewModel = LocationManagerViewModel()
    
    // Location Properties
    let setLongitude = LocationManagerViewModel.userLongitude
    let setLatitude = LocationManagerViewModel.userLatitude
    let radius = LocationManagerViewModel.radius
    
    // Reciever Property - Selected Category Sent Data
    var sentCategory: String?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // App Header
        if let titleImage = UIImage(named: "whatDoSmall") {
            headerView.configureImageViews(withImages: titleImage, subtitle: nil)
        }
    }
    
    // MARK: - Methods
    func showLocationAlert() {
        let alert = UIAlertController(title: "Starting Location", message: "To continue, search from your current location, or enter another location manually.", preferredStyle: .alert)
        
        let dismissAction = UIAlertAction(title: "Back To Home", style: .cancel) { _ in
            // Navigate back to Home if declining to enter location
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            let homeVC = storyboard.instantiateViewController(withIdentifier: "homeNav")
            /// This is to get the SceneDelegate object from your view controller
            /// then call the change root view controller function to change to main tab bar
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(homeVC)
        }
        
        let currentLocationAction = UIAlertAction(title: "Use Current Location", style: .default) { _ in
            self.updateUserLocation()
        }
        
        let newLocationAction = UIAlertAction(title: "Enter New Location", style: .default) { _ in
            self.showNewLocationAlert()
        }
        alert.addAction(dismissAction)
        alert.addAction(currentLocationAction)
        alert.addAction(newLocationAction)
        present(alert, animated: true)
    }
    
    func showNewLocationAlert() {
        let secondAlert = UIAlertController(title: "New Starting Location", message: "Enter a city name or street address below.", preferredStyle: .alert)
        secondAlert.addTextField { textField in
            textField.placeholder = "New Location"
        }
        
        let dismissAction = UIAlertAction(title: "Back To Home", style: .cancel) { _ in
            // Navigate back to Home if declining to enter location
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            let homeVC = storyboard.instantiateViewController(withIdentifier: "homeNav")
            /// This is to get the SceneDelegate object from your view controller
            /// then call the change root view controller function to change to main tab bar
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(homeVC)
        }
        
        let setLocationAction = UIAlertAction(title: "Set Location", style: .default) { _ in
            guard let contentTextField = secondAlert.textFields?.first,
                  let locationName = contentTextField.text else {return}
            self.viewModel.setLocationManually(locationName) { [weak self] location in
                /// Unwrap [weak self]
                guard let strongSelf = self else {return}
                guard let newLocation = location else {
                    self?.updateUserLocation()
                    return
                }
                strongSelf.viewModel.setLocationCoordinates(with: newLocation)
            }
        }
        secondAlert.addAction(dismissAction)
        secondAlert.addAction(setLocationAction)
        present(secondAlert, animated: true)
    }
    
    
    func updateUserLocation() {
        // Alert that allows user to use current location or set a location manually
        LocationManagerViewModel.shared.getUserLocation { [weak self] location in
            /// Unwrap [weak self]
            guard let strongSelf = self else {return}
            strongSelf.viewModel.setLocationCoordinates(with: location)
            
        }
    }
    // MARK: - Actions
    /// Radius in miles should be assigned to radius variable in model and converted to meters to use as parameter in network calls
    @IBAction func travelDistanceSliderValueChanged(_ sender: Any) {
        let distanceLabel = Int(round(travelDistanceSlider.value))
        travelRadiusMilesLabel.text = "\(distanceLabel) Mi."
        
        let distanceValue = Double(round(travelDistanceSlider.value))
        
        let miles = distanceValue
        
        let milesToMeters = miles.convert(from: .miles, to: .meters)
        
        let roundedMeters = Int(milesToMeters)
        
        LocationManagerViewModel.radius = "\(roundedMeters)"
        print (LocationManagerViewModel.radius!)
    }
    
    @IBAction func setLocationTapped(_ sender: Any) {
        showLocationAlert()
    }
    
    // MARK: - Navigation
    @IBAction func nextButtonTapped(_ sender: Any) {
        /// Check if longitude and latitude are set. If not, prompt the new alert controller for them to enter a location manually, which then sets the lat/long. Right now it is trying to navigate to next page before the coordinates are finished setting, and finding nil. The navigation needs to know the coordinate assignment completed before trying to move forward to next VC. The navigation needs to carry the category to following views, doesn't need to explicitly send the coordinates/travel radius info because those are global properties that are set and can be retrieved later when needed.
        /// Tried setting Dispatch asyncAfter on navigation, but maybe we need a switch statement.
        
        // check if coordinates are not nil and segue first. Then do blockoperations if nil?
        
        //        let queue = OperationQueue()
        //
        //        if self.setLongitude != nil && self.setLatitude != nil {
        //            navNextVC()
        //        } else {
        //            let setCoordOperation = BlockOperation {
        //                self.showNewLocationAlert()
        //            }
        //
        //            let navOperation = BlockOperation {
        //                self.navNextVC()
        //            }
        //
        //            navOperation.addDependency(setCoordOperation)
        //
        //            queue.addOperation(setCoordOperation)
        //            queue.addOperation(navOperation)
        //            queue.waitUntilAllOperationsAreFinished()
        //            print("Take me there!")
        //
      checkForCoordinates()
    }
            
    
    
    
    //    func setNewLocation(completion: @MainActor @escaping () -> ()) {
    //        /// Example dispatch to mimic behaviour
    //         DispatchQueue.main.async {
    //             Task.init(operation: <#T##() async -> _#>) {
    //                 await completion()
    //             }
    //         }
    //    }
    //
    var onTaskFinished:(() -> Void)?
    
    func checkForCoordinates() {
        if self.setLongitude != nil && self.setLatitude != nil {
            self.navNextVC()
            print("Take Me There!")
        } else {
            setEmptyCoordinates {
                print("\(self.setLatitude!), \(self.setLongitude!)")
                self.afterCoordCheckFinished()
            }
        }
    }
    
    func setEmptyCoordinates(completionHandler: @escaping () -> Void) {
        // Store completion handler for later
        onTaskFinished = completionHandler
        
        // Do task where you check for values in the coordinate properties
            self.showNewLocationAlert()
        }
    
    func afterCoordCheckFinished() {
        onTaskFinished?() // Call completion handler
        navNextVC()
        print("Take Me There!")
    }
    
    func navNextVC() {
        let storyboard = UIStoryboard(name: "CategoryRefinement", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "categoryRefinement") as? CategoryRefinementViewController {
            guard let category = self.sentCategory else { return }
            vc.sentCategory = category
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    /// Identify the critical section, then dispatch the critical section to a serial queue.
    /// Critical = coordinates have been set before navigation
    /// "Modifications to layout engine must not be perfomed from background thread after it has been accessed from main thread" - we are changing values of the coordinate properties
    //    let concurrentQueue = DispatchQueue(label: "Concurrent Queue", attributes: .concurrent)
    //
    //    let navigateNextVC = BlockOperation {
    //
    //        let storyboard = UIStoryboard(name: "CategoryRefinement", bundle: nil)
    //        if let vc = storyboard.instantiateViewController(withIdentifier: "categoryRefinement") as? CategoryRefinementViewController {
    //            guard let category = sentCategory else { return }
    //            vc.sentCategory = category
    //            Thread.sleep(forTimeInterval: Double.random(in: 0...2))
    //            self.navigationController?.pushViewController(vc, animated: true)
    //        }
    //        }
    
} // End of Class

extension Double {
    func convert(from originalUnit: UnitLength, to convertedUnit: UnitLength) -> Double {
        return Measurement(value: self, unit: originalUnit).converted(to: convertedUnit).value
    }
}
