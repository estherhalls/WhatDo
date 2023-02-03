//
//  Categories.swift
//  WhatDo
//
//  Created by Esther on 2/2/23.
//

import UIKit

struct CategoryViewModel {
    
    static let shared = CategoryViewModel()
    
    var categoryArray: [Category] = [
        
        Category(name: "dining", imageName: "diningCategory", headerImage: "headerDining", sfSymbol: SFSymbols().utensils, refinementQuestions: CategoryRefinementViewModel().diningCategory),
        //        self.categoryArray.append(dining)
        
        Category(name: "drinks", imageName: "drinkCategory", sfSymbol: SFSymbols().drink, refinementQuestions: CategoryRefinementViewModel().drinksCategory),
        //        selfcategoryArray.append(drinks)
        
        Category(name: "cinema", imageName: "cinemaCategory", headerImage: "headerCinema", sfSymbol: SFSymbols().popcorn, refinementQuestions: CategoryRefinementViewModel().cinemaCategory),
        
        Category(name: "events", imageName: "eventCategory", headerImage: "headerEvent", sfSymbol: SFSymbols().mic, refinementQuestions: CategoryRefinementViewModel().eventsCategory),
        
        Category(name: "activities", imageName: "activityCategory", headerImage: "headerActivity", sfSymbol: SFSymbols().mountain, refinementQuestions: CategoryRefinementViewModel().activitiesCategory),
        
        Category(name: "night out", imageName: "nightOutCategory", sfSymbol: SFSymbols().drink, sfSymbol2: SFSymbols().utensils, sfSymbol3: SFSymbols().mic, refinementQuestions: CategoryRefinementViewModel().nightOutCategory)
        
        //        return [dining, drinks, cinema, events, activities, nightOut]
    ]
}
