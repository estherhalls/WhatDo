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
    let cardData = []
    
    
    
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

// Individual Category Card Data
extension CategoryRefinementViewController {
    
    var diningCategory: [RefinementCardViewModel] {
        let questionOne = RefinementCardViewModel(leftLabel: "Fine Dining", rightLabel: "Casual Dining")
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B")
        let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
    }
    var drinksCategory: [RefinementCardViewModel] {
        let questionOne = RefinementCardViewModel(leftLabel: "Coffee/Tea", rightLabel: "Boozy Bevs")
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B")
        let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
    }
    var cinemaCategory: [RefinementCardViewModel] {
        let questionOne = RefinementCardViewModel(leftLabel: "Going Out", rightLabel: "Staying In")
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B")
        let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
    }
    var eventsCategory: [RefinementCardViewModel] {
        let questionOne = RefinementCardViewModel(leftLabel: "Concerts", rightLabel: "Art Festivals")
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B")
        let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
    }
    var activitiesCategory: [RefinementCardViewModel] {
        let questionOne = RefinementCardViewModel(leftLabel: "High Energy", rightLabel: "Low Energy")
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B")
        let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
    }
    var nightOutCategory: [RefinementCardViewModel] {
        let questionOne = RefinementCardViewModel(leftLabel: "Casual", rightLabel: "Feeling Fancy")
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B")
        let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
    }
}

// Card data arrays based on which category was selected by user on home page
extension CategoryRefinementViewController {
    // each viewModel card within its category's array will have its own question label, but all cards within a category will have same image (SF symbol)
    enum viewModels {
        
        case dining
        case drinks
        case cinema
        case events
        case activities
        case nightOut
        
        var viewModels: [RefinementCardViewModel]? {
            switch self {
            case .dining:
                return diningCategory
            case .drinks:
                return drinksCategory
            case .cinema:
                return cinemaCategory
            case .events:
                return eventsCategory
            case .nightOut:
                return nightOutCategory
            }
        }
    }
}

//extension RefinementCardViewModel {
//
//    var dining: [RefinementCardViewModel] {
//        let questionOne = RefinementCardViewModel(leftLabel: "Fine Dining", rightLabel: "Casual Dining")
//    }
//}
//var category = ""
//viewModels =
//
//}
