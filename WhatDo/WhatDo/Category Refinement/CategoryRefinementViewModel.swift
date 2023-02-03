//
//  CategoryRefinementViewModel.swift
//  WhatDo
//
//  Created by Esther on 1/2/23.
//

import UIKit

struct CategoryRefinementViewModel {

    // Card Data by Category
    var diningCategory: [RefinementCardViewModel] {
        var sfSymbol = SFSymbols().utensils
        
        let questionOne = RefinementCardViewModel(leftLabel: "Fine Dining But with more text this time", rightLabel: "Casual Dining", sfSymbol: sfSymbol)
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B", sfSymbol: sfSymbol)
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B", sfSymbol: sfSymbol)
        let questionFour = RefinementCardViewModel(leftLabel: "Card4: A", rightLabel: "Card2: B", sfSymbol: sfSymbol)
        
        return [questionOne, questionTwo, questionThree, questionFour]
    }
    
    var drinksCategory: [RefinementCardViewModel]{
        var sfSymbol = SFSymbols().drink
        
        let questionOne = RefinementCardViewModel(leftLabel: "Coffee/Tea", rightLabel: "Boozy Bevs", sfSymbol: sfSymbol)
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B", sfSymbol: sfSymbol)
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B", sfSymbol: sfSymbol)
        let questionFour = RefinementCardViewModel(leftLabel: "Card4: A", rightLabel: "Card2: B", sfSymbol: sfSymbol)
        
        return [questionOne, questionTwo, questionThree, questionFour]
    }
    
    var cinemaCategory: [RefinementCardViewModel]{
        var sfSymbol = SFSymbols().popcorn
        
        let questionOne = RefinementCardViewModel(leftLabel: "Going Out", rightLabel: "Staying In", sfSymbol: sfSymbol)
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B", sfSymbol: sfSymbol)
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B", sfSymbol: sfSymbol)
        let questionFour = RefinementCardViewModel(leftLabel: "Card4: A", rightLabel: "Card2: B", sfSymbol: sfSymbol)
        
        return [questionOne, questionTwo, questionThree, questionFour]
    }
    
    var eventsCategory: [RefinementCardViewModel]{
        var sfSymbol = SFSymbols().mic
        
        let questionOne = RefinementCardViewModel(leftLabel: "Concerts", rightLabel: "Art Festivals", sfSymbol: sfSymbol)
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B", sfSymbol: sfSymbol)
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B", sfSymbol: sfSymbol)
        let questionFour = RefinementCardViewModel(leftLabel: "Card4: A", rightLabel: "Card2: B", sfSymbol: sfSymbol)
        
        return [questionOne, questionTwo, questionThree, questionFour]
    }
    
    var activitiesCategory: [RefinementCardViewModel]{
        var sfSymbol = SFSymbols().mountain
        
        let questionOne = RefinementCardViewModel(leftLabel: "High Energy", rightLabel: "Low Energy", sfSymbol: sfSymbol)
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B", sfSymbol: sfSymbol)
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B", sfSymbol: sfSymbol)
        let questionFour = RefinementCardViewModel(leftLabel: "Card4: A", rightLabel: "Card2: B", sfSymbol: sfSymbol)
        
        return [questionOne, questionTwo, questionThree, questionFour]
    }
    
    var nightOutCategory: [RefinementCardViewModel]{
        var sfSymbol = SFSymbols().drink
        var sfSymbol2 = SFSymbols().utensils
        var sfSymbol3 = SFSymbols().mic
        
        let questionOne = RefinementCardViewModel(leftLabel: "Casual", rightLabel: "Feeling Fancy", sfSymbol: sfSymbol, sfSymbol2: sfSymbol2, sfSymbol3: sfSymbol3)
        let questionTwo = RefinementCardViewModel(leftLabel: "Card2: A", rightLabel: "Card2: B", sfSymbol: sfSymbol, sfSymbol2: sfSymbol2, sfSymbol3: sfSymbol3)
        let questionThree = RefinementCardViewModel(leftLabel: "Card3: A", rightLabel: "Card3: B", sfSymbol: sfSymbol, sfSymbol2: sfSymbol2, sfSymbol3: sfSymbol3)
        let questionFour = RefinementCardViewModel(leftLabel: "Card4: A", rightLabel: "Card2: B", sfSymbol: sfSymbol, sfSymbol2: sfSymbol2, sfSymbol3: sfSymbol3)
        
        return [questionOne, questionTwo, questionThree, questionFour]
        
    }
}

