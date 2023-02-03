//
//  Categories.swift
//  WhatDo
//
//  Created by Esther on 2/2/23.
//

import UIKit

struct Categories {


    let dining = Category(name: "dining", imageName: "diningCategory", headerImage: "headerDining", sfSymbol: UIImage(systemName: "fork.knife") ?? UIImage(), refinementQuestions: CategoryRefinementViewModel().diningCategory)
    
    let drinks = Category(name: "drinks", imageName: "drinkCategory", sfSymbol: UIImage(systemName: "wineglass") ?? UIImage(), refinementQuestions: CategoryRefinementViewModel().drinksCategory)
    
    let cinema = Category(name: "cinema", imageName: "cinemaCategory", headerImage: "headerCinema", sfSymbol: UIImage(systemName: "popcorn") ?? UIImage(), refinementQuestions: CategoryRefinementViewModel().cinemaCategory)
    
    let events = Category(name: "events", imageName: "eventCategory", headerImage: "headerEvent", sfSymbol: UIImage(systemName: "music.mic") ?? UIImage(), refinementQuestions: CategoryRefinementViewModel().eventsCategory)
   
    let activities = Category(name: "activities", imageName: "activityCategory", headerImage: "headerActivity", sfSymbol: UIImage(systemName: "mountain.2") ?? UIImage(), refinementQuestions: CategoryRefinementViewModel().activitiesCategory)
    
    let nightOut = Category(name: "night out", imageName: "nightOutCategory", sfSymbol: UIImage(systemName: "wineglass") ?? UIImage(), sfSymbol2: UIImage(systemName: "fork.knife") ?? UIImage(), sfSymbol3: UIImage(systemName: "music.mic") ?? UIImage(), refinementQuestions: CategoryRefinementViewModel().nightOutCategory)
    
    
}
