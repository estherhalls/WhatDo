//
//  CategoryRefinementViewController.swift
//  WhatDo
//
//  Created by Esther on 12/28/22.
//

import UIKit

class CategoryRefinementViewController: UIViewController, CardViewDataSource {
    
    @IBOutlet weak var headerView: HeaderLargeView!
    @IBOutlet weak var swipeableCardView: CardViewContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // App Header
        if let titleImage = UIImage(named: "whatDoSmall") {
            headerView.configureImageViews(withImages: titleImage, subtitle: nil)
        }
        // Swipeable cards will need view model data sources for the questions for each category.
        // Create cases for home page that load different sets of questions based on which category is tapped - same for "refine your search" labels if that needs to change between categories
        // To achieve this, the cases would lead to different view model source files
        swipeableCardView.dataSource = self
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

// MARK: - Swipeable Card View Data Source

// Conform to CardViewDataSource
extension CategoryRefinementViewController {
    
    func numberOfCards() -> Int {
        return viewModels.count
    }
    
    func card(forQuestionAtIndex index: Int) -> SwipeableCardView {
        let viewModel = viewModels[index]
        let cardView = SwipeableCardView()
        cardView.viewModel = viewModel
        return cardView
    }
    
    func viewForEmptyCards() -> UIView? {
        return nil
    }
    
}

// Card data arrays based on which category was selected by user on home page
extension CategoryRefinementViewController {
    // each viewModel card within its category's array will have its own question label, but all cards within a category will have same image (SF symbol)
    enum CategoryQuestions {
        case dining
        case drinks
        case cinema
        case events
        case activities
        case nightOut
    }
}
