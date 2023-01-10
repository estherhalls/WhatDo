//
//  CategoryRefinementViewModel.swift
//  WhatDo
//
//  Created by Esther on 1/2/23.
//

import UIKit

struct CategoryRefinementViewModel {
    
    // Category Symbols
    let drink = UIImage(systemName: "wineglass") ?? UIImage()
    let utensils = UIImage(systemName: "fork.knife") ?? UIImage()
    let popcorn = UIImage(systemName: "popcorn") ?? UIImage()
    let mic = UIImage(systemName: "music.mic") ?? UIImage()
    let mountain = UIImage(systemName: "mountain.2") ?? UIImage()
    
    // Card Data by Category
    var diningCategory: [RefinementCardViewModel] {
        let questionOne = RefinementCardViewModel(leftLabel: "Fine Dining But with more text this time", rightLabel: "Casual Dining", sfSymbol: utensils)
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B", sfSymbol: utensils)
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B", sfSymbol: utensils)
        let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B", sfSymbol: utensils)
        
        return [questionOne, questionTwo, questionThree, questionFour]
    }
    
    var drinksCategory: [RefinementCardViewModel]{
        let questionOne = RefinementCardViewModel(leftLabel: "Coffee/Tea", rightLabel: "Boozy Bevs", sfSymbol: drink)
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B", sfSymbol: drink)
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B", sfSymbol: drink)
        let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B", sfSymbol: drink)
        
        return [questionOne, questionTwo, questionThree, questionFour]
    }
    
    var cinemaCategory: [RefinementCardViewModel]{
        let questionOne = RefinementCardViewModel(leftLabel: "Going Out", rightLabel: "Staying In", sfSymbol: popcorn)
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B", sfSymbol: popcorn)
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B", sfSymbol: popcorn)
        let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B", sfSymbol: popcorn)
        
        return [questionOne, questionTwo, questionThree, questionFour]
    }
    
    var eventsCategory: [RefinementCardViewModel]{
        let questionOne = RefinementCardViewModel(leftLabel: "Concerts", rightLabel: "Art Festivals", sfSymbol: mic)
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B", sfSymbol: mic)
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B", sfSymbol: mic)
        let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B", sfSymbol: mic)
        
        return [questionOne, questionTwo, questionThree, questionFour]
    }
    
    var activitiesCategory: [RefinementCardViewModel]{
        let questionOne = RefinementCardViewModel(leftLabel: "High Energy", rightLabel: "Low Energy", sfSymbol: mountain)
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B", sfSymbol: mountain)
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B", sfSymbol: mountain)
        let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B", sfSymbol: mountain)
        
        return [questionOne, questionTwo, questionThree, questionFour]
    }
    
    var nightOutCategory: [RefinementCardViewModel]{
        let questionOne = RefinementCardViewModel(leftLabel: "Casual", rightLabel: "Feeling Fancy", sfSymbol: drink, sfSymbol2: utensils, sfSymbol3: mic)
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B", sfSymbol: drink, sfSymbol2: utensils, sfSymbol3: mic)
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B", sfSymbol: drink, sfSymbol2: utensils, sfSymbol3: mic)
        let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B", sfSymbol: drink, sfSymbol2: utensils, sfSymbol3: mic)
        
        return [questionOne, questionTwo, questionThree, questionFour]
        
    }
}

