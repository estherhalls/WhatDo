//
//  RefinementCardViewController.swift
//  WhatDo
//
//  Created by Esther on 1/2/23.
//

import UIKit

class RefinementCard: SwipeableCardView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var backgroundContainerView: UIView!
    @IBOutlet weak var sfSymbol: UIImageView?
    @IBOutlet weak var sfSymbol2: UIImageView?
    @IBOutlet weak var sfSymbol3: UIImageView?
    @IBOutlet weak var labelLeft: UILabel!
    @IBOutlet weak var labelRight: UILabel!
    
    // Shadow View
    private weak var shadowView: UIView?
    
    // Inner Margin
    private static let kInnerMargin: CGFloat = 20.0
    
    var viewModel: RefinementCardViewModel? {
        didSet {
            configure(forViewModel: viewModel)
        }
    }
    
    // MARK: -  Configure Cards
    
    private func configure(forViewModel viewModel: RefinementCardViewModel?) {
      
        if let viewModel {
            labelLeft.text = viewModel.leftLabel
            labelRight.text = viewModel.rightLabel
            sfSymbol?.image = viewModel.sfSymbol
            sfSymbol2?.image = viewModel.sfSymbol2
            sfSymbol3?.image = viewModel.sfSymbol3
            
            backgroundContainerView.layer.cornerRadius = 14.0
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureShadow()
    }
    
    // MARK: - Shadow
    
    private func configureShadow() {
        self.shadowView?.removeFromSuperview()
        let shadowView = UIView(frame: CGRect(x:RefinementCard.kInnerMargin,
                                              y: RefinementCard.kInnerMargin,
                                              width: bounds.width - (2 * RefinementCard.kInnerMargin),
                                              height: bounds.height - (2 * RefinementCard.kInnerMargin)))
        insertSubview(shadowView, at: 0)
        self.shadowView = shadowView
        self.applyShadow(width: CGFloat(0.0), height: CGFloat(0.0))
    }
    
    
    private func applyShadow(width: CGFloat, height: CGFloat) {
        if let shadowView {
            let shadowPath = UIBezierPath(roundedRect: shadowView.bounds, cornerRadius: 14.0)
            shadowView.layer.masksToBounds = false
            shadowView.layer.shadowRadius = 8.0
            shadowView.layer.shadowColor = UIColor.black.cgColor
            shadowView.layer.shadowOffset = CGSize(width: width, height: height)
            shadowView.layer.shadowOpacity = 0.15
            shadowView.layer.shadowPath = shadowPath.cgPath
        }
    }
}

// MOVE THIS TO CORRECT FILES

// Home VC

//var category = ""
/// Add to ibaction body for each category button:
/// category = "diningCategory"
/// self.performSegue(withIdentifier: "toRefinementVC", sender: self"
//  each viewModel card within its category's array will have its own question label, but all cards within a category will have same image (SF symbol)
//override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if segue.identifier == "toRefinementVC" {
//        let destinationVC = segue.destination as! CategoryRefinementViewController
//        // Assuming you created a variable called sentCategory in the TableViewController
//        destinationVC.sentCategory = category
//    }
//}

