//
//  TabBarViewController.swift
//  WhatDo
//
//  Created by Esther on 1/5/23.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = UIColor(white: 1.0, alpha: 0.65
)//        self.viewControllers = [firstTab(), secondTab(), thirdTab(), fourthTab(), fifthTab()]
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
//        if tabBarController.selectedIndex > 0

    }

}
