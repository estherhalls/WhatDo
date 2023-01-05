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
    var sentCategory = ""
//    {
//        didSet {
//            updateViews()
//        }
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // App Header
        if let titleImage = UIImage(named: "whatDoSmall") {
            headerView.configureImageViews(withImages: titleImage, subtitle: nil)
        }
        // Swipeable cards will need view model data sources for the questions for each category.
        swipeableCardView.dataSource = self
    }
    
    // MARK: - Methods
    func updateViews() {
        //        guard let category = sentCategory else {return}
        //        let image = park.images[0]
    }
        
    // Individual Category Card Data
    let categoryArray = CategoryRefinementViewModel()
    var cardData: [RefinementCardViewModel] {
        // Switch statement instead of if? Cleaner?
        if sentCategory == "diningCategory" {
            return categoryArray.diningCategory
        }
        
        if sentCategory == "drinksCategory" {
            return categoryArray.drinksCategory
            }

        if sentCategory == "cinemaCategory" {
            return categoryArray.cinemaCategory
            }

        if sentCategory == "eventsCategory" {
            return categoryArray.eventsCategory
            }

        if sentCategory == "activitiesCategory" {
            return categoryArray.activitiesCategory
            }

        if sentCategory == "nightOutCategory" {
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

