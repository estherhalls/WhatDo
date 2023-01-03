//
//  RefinementCardViewController.swift
//  WhatDo
//
//  Created by Esther on 1/2/23.
//

import UIKit

class RefinementCard: SwipeableCardView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var categorySymbolImage: UIImageView!
    @IBOutlet weak var nightOutSymbol2: UIImageView?
    @IBOutlet weak var nightOutSymbol3: UIImageView?
    @IBOutlet weak var labelLeft: UILabel!
    @IBOutlet weak var labelRight: UILabel!
    
 
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

