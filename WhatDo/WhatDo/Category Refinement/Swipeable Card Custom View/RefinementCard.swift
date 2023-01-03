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

var category = ""
/// Add to ibaction body for each category button:
/// category = "diningCategory"
/// self.performSegue(withIdentifier: "toRefinementVC", sender: self"

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toRefinementVC" {
        let destinationVC = segue.destination as! CategoryRefinementViewController
        // Assuming you created a variable called sentCategory in the TableViewController
        destinationVC.sentCategory = category
    }
}

// Refinement View Controller
let data = [RefinementCardViewModel]()
var viewModels = sentCategory
if sentCategory == "dining" {
    
}
var dining: [RefinementCardViewModel] {
    let questionOne = RefinementCardViewModel(leftLabel: "Fine Dining", rightLabel: "Casual Dining")
    let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
    let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B")
    let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
}
var drinks: [RefinementCardViewModel] {
    let questionOne = RefinementCardViewModel(leftLabel: "Coffee/Tea", rightLabel: "Boozy Bevs")
    let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
    let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B")
    let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
}
var cinema: [RefinementCardViewModel] {
    let questionOne = RefinementCardViewModel(leftLabel: "Going Out", rightLabel: "Staying In")
    let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
    let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B")
    let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
}
var events: [RefinementCardViewModel] {
    let questionOne = RefinementCardViewModel(leftLabel: "Concerts", rightLabel: "Art Festivals")
    let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
    let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B")
    let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
}
var activities: [RefinementCardViewModel] {
    let questionOne = RefinementCardViewModel(leftLabel: "High Energy", rightLabel: "Low Energy")
    let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
    let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B")
    let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
}
var nightOut: [RefinementCardViewModel] {
    let questionOne = RefinementCardViewModel(leftLabel: "Casual", rightLabel: "Feeling Fancy")
    let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
    let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B")
    let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
}
