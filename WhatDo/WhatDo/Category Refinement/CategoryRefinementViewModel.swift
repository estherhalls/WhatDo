//
//  CategoryRefinementViewModel.swift
//  WhatDo
//
//  Created by Esther on 1/2/23.
//

import Foundation

struct CategoryRefinementViewModel {
    
    // Card Data by Category
    var diningCategory: [RefinementCardViewModel] {
        let questionOne = RefinementCardViewModel(leftLabel: "Fine Dining But with more text this time", rightLabel: "Casual Dining")
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B")
        let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
        
        return [questionOne, questionTwo, questionThree, questionFour]
    }
    
    var drinksCategory: [RefinementCardViewModel]{
        let questionOne = RefinementCardViewModel(leftLabel: "Coffee/Tea", rightLabel: "Boozy Bevs")
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B")
        let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
        
        return [questionOne, questionTwo, questionThree, questionFour]
    }
    
    var cinemaCategory: [RefinementCardViewModel]{
        let questionOne = RefinementCardViewModel(leftLabel: "Going Out", rightLabel: "Staying In")
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B")
        let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
        
        return [questionOne, questionTwo, questionThree, questionFour]
    }
    
    var eventsCategory: [RefinementCardViewModel]{
        let questionOne = RefinementCardViewModel(leftLabel: "Concerts", rightLabel: "Art Festivals")
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B")
        let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
        
        return [questionOne, questionTwo, questionThree, questionFour]
    }
    
    var activitiesCategory: [RefinementCardViewModel]{
        let questionOne = RefinementCardViewModel(leftLabel: "High Energy", rightLabel: "Low Energy")
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B")
        let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
        
        return [questionOne, questionTwo, questionThree, questionFour]
    }
    
    var nightOutCategory: [RefinementCardViewModel]{
        let questionOne = RefinementCardViewModel(leftLabel: "Casual", rightLabel: "Feeling Fancy")
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B")
        let questionFour = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B")
        
        return [questionOne, questionTwo, questionThree, questionFour]
        
    }
}
