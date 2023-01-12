//
//  CardViewDataSource.swift
//  WhatDo
//
//  Created by Esther on 12/28/22.
//

import UIKit

/// Data Source for all information required for CardViewContainer to layout a series of cards
protocol CardViewDataSource: AnyObject {
    // Determines number of cards to be added into the CardViewContainer. Not all cards will initially be visible - only first three (or other quantity chosen). As cards are swiped away, new cards will appear until this number is reached.
    /// - Returns: number of cards for user interaction
    func numberOfCards() -> Int
    
    // Provides the card view to be displayed within the CardViewContainer. The information displayed will update based on index within the stack.
    /// - Returns: card view to display
    func card(forQuestionAtIndex index: Int) -> SwipeableCardView
    
    // Provides a view to be displayed underneath all of the cards when they have all been swiped away
    /// - Returns: view to be displayed underneath all cards
    func viewForEmptyCards() -> UIView?
    
}
