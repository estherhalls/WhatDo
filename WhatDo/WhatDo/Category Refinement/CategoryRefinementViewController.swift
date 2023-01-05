//
//  CategoryRefinementViewController.swift
//  WhatDo
//
//  Created by Esther on 12/28/22.
//

import UIKit

class CategoryRefinementViewController: UIViewController, CardViewDataSource {
    
    // MARK: - Outlets
    @IBOutlet weak var headerView: HeaderLargeView!
    @IBOutlet weak var swipeableCardView: CardViewContainer!

    // Reciever Property - Selected Category Sent Data
    var sentCategory: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // App Header
        if let titleImage = UIImage(named: "whatDoSmall") {
            headerView.configureImageViews(withImages: titleImage, subtitle: nil)
        }
        // Swipeable cards will need view model data sources for the questions for each category.
        swipeableCardView.dataSource = self
    }
        
    // Individual Category Card Data
    let categoryArray = CategoryRefinementViewModel()
    var cardData: [RefinementCardViewModel] {
        // Switch statement instead of if? Cleaner?
        if sentCategory == "diningCategory" {
            return categoryArray.diningCategory
        }
        
        if sentCategory == "drinkCategory" {
            return categoryArray.drinksCategory
            }

        if sentCategory == "cinemaCategory" {
            return categoryArray.cinemaCategory
            }

        if sentCategory == "eventCategory" {
            return categoryArray.eventsCategory
            }

        if sentCategory == "activityCategory" {
            return categoryArray.activitiesCategory
            }

        if sentCategory == "nightOutCategory" {
            return categoryArray.nightOutCategory
        }
        return []
    }
    
    @IBAction func rouletteButtonTapped(_ sender: Any) {
        // Navigate to Selection Results and bring information about network call without refining (random?)
        
        /// Display the home view via tab bar controller
        let storyboard = UIStoryboard(name: "SelectionResults", bundle: nil)
        let resultsVC = storyboard.instantiateViewController(withIdentifier: "selectionResultsVC")
        
        /// This is to get the SceneDelegate object from your view controller
        /// then call the change root view controller function to change to main tab bar
        /// Use this rather than PresentVC function to clear memory and show home as root controller instead of card on top
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(resultsVC)
    
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
    }

