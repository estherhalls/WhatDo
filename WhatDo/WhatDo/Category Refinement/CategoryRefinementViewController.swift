//
//  CategoryRefinementViewController.swift
//  WhatDo
//
//  Created by Esther on 12/28/22.
//

import UIKit

class CategoryRefinementViewController: UIViewController, CardViewDataSource, CardViewContainerDelegate {
 
    // MARK: - Outlets
    @IBOutlet var backgroundGradient: UIView!
    @IBOutlet weak var headerView: HeaderLargeView!
    @IBOutlet weak var swipeableCardView: CardViewContainer!
    
    // Reciever Property - Selected Category Sent Data
    let cardData: [RefinementCardViewModel] = []
    var sentCategory: Category? {
        didSet {
            guard let category = sentCategory else { return }
            let cardData = category.refinementQuestions
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create Gradient Background Layer
        let gradientLayer = CAGradientLayer()
        /// Set the size of the layer to be equal to the size of the display
        gradientLayer.frame = view.bounds
        /// Set an array of core graphics colors (.cgColor) to create the gradient
        gradientLayer.colors = [UIColor(red: 0.80, green: 0.16, blue: 0.05, alpha: 1.00).cgColor, UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor]
        /// Rasterize this static layer to improve performance
        gradientLayer.shouldRasterize = true
        /// Apply the gradient to the backgroundGradient UIView
        backgroundGradient.layer.insertSublayer(gradientLayer, at: 0)
        
        // App Header
        if let titleImage = UIImage(named: "whatDoSmall") {
            headerView.configureImageViews(withImages: titleImage, subtitle: nil)
        }
        
        // Check that Coordinate and travel radius properties have been set. If not, prompt user to input location or kick them back to home screen.
        
        // Swipeable cards will need view model data sources for the questions for each category.
        swipeableCardView.dataSource = self
        swipeableCardView.navDelegate = self
    }
    func updateViews() {
        
    }
    // Individual Category Card Data
//    let categoryArray = CategoryRefinementViewModel()
//    var cardData: [RefinementCardViewModel] {
//        didSet {
//            guard let category = sentCategory else { return }
//            category.refinementQuestions
//        }
//    }
//        // Switch statement instead of if? Cleaner?
//        if sentCategory == "diningCategory" {
//            return categoryArray.diningCategory
//        }
//
//        if sentCategory == "drinkCategory" {
//            return categoryArray.drinksCategory
//        }
//
//        if sentCategory == "cinemaCategory" {
//            return categoryArray.cinemaCategory
//        }
//
//        if sentCategory == "eventCategory" {
//            return categoryArray.eventsCategory
//        }
//
//        if sentCategory == "activityCategory" {
//            return categoryArray.activitiesCategory
//        }
//
//        if sentCategory == "nightOutCategory" {
//            return categoryArray.nightOutCategory
//        }
//        return []
//    }
    
    // MARK: - Navigation
    @IBAction func rouletteButtonTapped(_ sender: Any) {
        // Navigate to Selection Results and bring information about network call without refining (random?)
        
        /// Display the results view
        let storyboard = UIStoryboard(name: "SelectionResults", bundle: nil)
        let resultsVC = storyboard.instantiateViewController(withIdentifier: "selectionResultsVC")
        self.navigationController?.pushViewController(resultsVC, animated: true)
    }
    
}
// MARK: - Swipeable Card View Data Source

// Conform to CardViewDataSource
extension CategoryRefinementViewController {
    
    func numberOfCards() -> Int {
        return cardData.count
    }
    
    func card(forQuestionAtIndex index: Int) -> SwipeableCardView {
        let viewModel = cardData[index]
        let cardView = RefinementCard()
        cardView.viewModel = viewModel
        return cardView
    }
    
    func viewForEmptyCards() -> UIView? {
        return nil
    }
    
    // Will eventually want to pass the completed api call with this
    func navigateToNextView() {
        /// Display the results view
        let storyboard = UIStoryboard(name: "SelectionResults", bundle: nil)
        let resultsVC = storyboard.instantiateViewController(withIdentifier: "selectionResultsVC")
        self.navigationController?.pushViewController(resultsVC, animated: true)
    }
}



