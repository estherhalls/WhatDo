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
    
    // Category Selected - sent data
    let sentCategory: String = "dining"
    
    
    
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
        if sentCategory == "dining" {
            return categoryArray.diningCategory
        }
        
        if sentCategory == "drinks" {
            return categoryArray.drinksCategory
            }

        if sentCategory == "cinema" {
            return categoryArray.cinemaCategory
            }

        if sentCategory == "events" {
            return categoryArray.eventsCategory
            }

        if sentCategory == "activities" {
            return categoryArray.activitiesCategory
            }

        if sentCategory == "nightOut" {
            return categoryArray.nightOutCategory
        }
        return []
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

