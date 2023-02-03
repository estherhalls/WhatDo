//
//  Categories.swift
//  WhatDo
//
//  Created by Esther on 2/2/23.
//

import UIKit

class CategoryViewModel {
    
    static let shared = CategoryViewModel()
    private(set) var categories: [Category] = []
    
    // Category Data
    var dining: Category {
        var category = Category(name: "dining", imageName: "diningCategory", headerImage: "headerDining", sfSymbol: UIImage(systemName: "fork.knife") ?? UIImage(), refinementQuestions: CategoryRefinementViewModel().diningCategory)
        self.categories.append(category)
        return category
    }
    
    var drinks: Category {
        let category = Category(name: "drinks", imageName: "drinkCategory", sfSymbol: UIImage(systemName: "wineglass") ?? UIImage(), refinementQuestions: CategoryRefinementViewModel().drinksCategory)
        self.categories.append(category)
        return category
    }
    
    var cinema: Category {
        let category = Category(name: "cinema", imageName: "cinemaCategory", headerImage: "headerCinema", sfSymbol: UIImage(systemName: "popcorn") ?? UIImage(), refinementQuestions: CategoryRefinementViewModel().cinemaCategory)
        self.categories.append(category)
        return category
    }
    
    var events: Category {
        let category = Category(name: "events", imageName: "eventCategory", headerImage: "headerEvent", sfSymbol: UIImage(systemName: "music.mic") ?? UIImage(), refinementQuestions: CategoryRefinementViewModel().eventsCategory)
        self.categories.append(category)
        return category
    }

    var activities: Category {
        let category = Category(name: "activities", imageName: "activityCategory", headerImage: "headerActivity", sfSymbol: UIImage(systemName: "mountain.2") ?? UIImage(), refinementQuestions: CategoryRefinementViewModel().activitiesCategory)
        self.categories.append(category)
        return category
    }

    var nightOut: Category {
        let category = Category(name: "night out", imageName: "nightOutCategory", sfSymbol: UIImage(systemName: "wineglass") ?? UIImage(), sfSymbol2: UIImage(systemName: "fork.knife") ?? UIImage(), sfSymbol3: UIImage(systemName: "music.mic") ?? UIImage(), refinementQuestions: CategoryRefinementViewModel().nightOutCategory)
        self.categories.append(category)
        return category
    }

}
