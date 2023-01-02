//
//  CategoryRefinementViewController.swift
//  WhatDo
//
//  Created by Esther on 12/28/22.
//

import UIKit

class CategoryRefinementViewController: UIViewController {
    
    @IBOutlet weak var headerView: HeaderLargeView!
    @IBOutlet weak var swipeableCardView: CardViewContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let titleImage = UIImage(named: "whatDoSmall") {
            headerView.configureImageViews(withImages: titleImage, subtitle: nil)
        }
        // Do any additional setup after loading the view.
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
