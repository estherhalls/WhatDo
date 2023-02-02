//
//  SwipeableCardsPresentationController.swift
//  WhatDo
//
//  Created by Esther on 2/2/23.
//

import UIKit

class SwipeableCardsPresentationController: UIPresentationController {

    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
      super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    override func dismissalTransitionWillBegin() {
      // Implement dismissal animations
//        /// Display the results view
//        let storyboard = UIStoryboard(name: "SelectionResults", bundle: nil)
//        let resultsVC = storyboard.instantiateViewController(withIdentifier: "selectionResultsVC")
//        self.navigationController?.pushViewController(resultsVC, animated: true)
    }
    
}
