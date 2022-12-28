//
//  CardViewContainer.swift
//  WhatDo
//
//  Created by Esther on 12/28/22.
//

import Foundation
/// The swipeable card views are held within this container view on our storyboards. This container is responsible for organizing the cards inside of it and works kind of like a collection view.
/// Each Category will require its own container view and unique information for the cards, but the card xib itself should be able to be reused.
/// Category Refinement View > Card Container > Swipeable Cards
/// Must conform to our SwipeableCardViewDataSource and SwipeableCardViewDelegate protocols
/// Data source provides numberOfCards and the optionality to display the cards beneath so you know how many remain. At each index, a SwipeableCardView xib will be displayed.
