//
//  CustomTabBarController.swift
//  WhatDo
//
//  Created by Esther on 1/17/23.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    let longitude = LocationManagerViewModel.shared.userLongitude
    let latitude = LocationManagerViewModel.shared.userLatitude
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.viewControllers = [firstTab(), secondTab(), thirdTab(), fourthTab(), fifthTab()]
        self.delegate = self
    }
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        // If view controller is UIViewController as? YelpCVViewController and global location paramaters are not set, return false and trigger alert controller -> set location -> trigger this function again? or another way to navigate forward
//        if tabBarController.selectedIndex > 0 && longitude == nil && latitude == nil {
//            return false
//        }
//        return true
//    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // If view controller is UIViewController as? YelpCVViewController (or any index greater than home/0) and global location paramaters are not set, return false and trigger alert controller -> set location -> trigger this function again? or another way to navigate forward
//        self.navigationController?.pushViewController(demoThreeVC, animated: true) but the VC name is entered using dependency injection based on the index number being selected?
        print("Tab Index:", tabBarController.selectedIndex)
        if tabBarController.selectedIndex > 0

    }

}
