//
//  TabBarViewController.swift
//  WhatDo
//
//  Created by Esther on 1/5/23.
//

import UIKit

// Collection of view Controllers
class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
// Create Instances of View Controllers
        let homeVC = HomeViewController()
        let yelpVC = YelpCVViewController()
//        view.backgroundColor = .systemBackground
//           UITabBar.appearance().barTintColor = .systemBackground
//           tabBar.tintColor = .label
//           setupVCs()
    }
//    // Create View Controllers
//    fileprivate func createNavController(for rootViewController: UIViewController,
//                                                    title: String,
//                                                    image: UIImage) -> UIViewController {
//          let navController = UINavigationController(rootViewController: rootViewController)
//          navController.tabBarItem.title = title
//          navController.tabBarItem.image = image
//          navController.navigationBar.prefersLargeTitles = true
//          rootViewController.navigationItem.title = title
//          return navController
//      }
//    // Assign View controllers to tab bar
//    func setupVCs() {
//          viewControllers = [
//              createNavController(for: HomeViewController(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "brain.head.profile")!),
//              createNavController(for: YelpCVViewController(), title: NSLocalizedString("Activity", comment: ""), image: UIImage(systemName: "mountain.2")!),
//              createNavController(for: YelpCVViewController(), title: NSLocalizedString("Dining", comment: ""), image: UIImage(systemName: "fork.knife")!),
//              createNavController(for: YelpCVViewController(), title: NSLocalizedString("Event", comment: ""), image: UIImage(systemName: "music.mic")!),
//              createNavController(for: YelpCVViewController(), title: NSLocalizedString("Cinema", comment: ""), image: UIImage(systemName: "popcorn")!)
//          ]
//      }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
