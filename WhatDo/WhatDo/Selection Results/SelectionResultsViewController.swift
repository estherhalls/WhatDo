//
//  SelectionResultsViewController.swift
//  WhatDo
//
//  Created by Esther on 1/5/23.
//

import UIKit

class SelectionResultsViewController: UIViewController {

    @IBOutlet weak var whatDoHeaderViewSmall: HeaderLargeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // App Header
        if let titleImage = UIImage(named: "whatDoSmall") {
            whatDoHeaderViewSmall.configureImageViews(withImages: titleImage, subtitle: nil)
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
