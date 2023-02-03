//
//  CardViewContainer.swift
//  WhatDo
//
//  Created by Esther on 12/28/22.
//

import UIKit

protocol CardViewContainerDelegate: AnyObject {
    func navigateToNextView()
}

/// The swipeable card views are held within this container view on our storyboards. This container is responsible for organizing the cards inside of it and works kind of like a collection view.
/// Each Category will require its own container view and unique information for the cards, but the card xib itself should be able to be reused.
/// Category Refinement View > Card Container > Swipeable Cards
/// Must conform to our CardViewDataSource and SwipeableCardViewDelegate protocols
/// Data source provides numberOfCards and the optionality to display the cards beneath so you know how many remain. At each index, a SwipeableCardView xib will be displayed.
/// Each time reloadData() is called, it will remove any existing card view from superview and insert the first 3 card views from the dataSource as subviews. To achieve stacked effect of question cards, the frame of each card is manipulated based on its index.

class CardViewContainer: UIView, SwipeableViewDelegate {
    
    var delegate: CardViewDelegate?
    weak var navDelegate: CardViewContainerDelegate?
    
    var vc = CategoryRefinementViewController()
    
    var dataSource: CardViewDataSource? {
        didSet {
            reloadData()
        }
    }
    
    private var cardViews: [SwipeableCardView] = []
    
    private var visibleCardViews: [SwipeableCardView] {
        return subviews as? [SwipeableCardView] ?? []
    }
    
    private var remainingCards: Int = 0
    
    static let numberOfVisibleCards: Int = 3
    
   private var timesSwiped = 0
    
    // Container:
    static let horizontalInset: CGFloat = 12.0
    static let verticalInset: CGFloat = 12.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Lifecycle
    
    // Reloads the data used to layout card views in the card stack. Removes all existing card views from superview and calls the dataSource to layout new card views as subviews.
    /// Frame of each card is manipulated based on its index to achieve stacked appearance (within nested functions addCardView -> setFrame)
    func reloadData() {
        removeAllCardViews()
        guard let dataSource = dataSource else {
            return
        }
        
        let numberOfCards = dataSource.numberOfCards()
        remainingCards = numberOfCards
        
        for index in 0..<min(numberOfCards, CardViewContainer.numberOfVisibleCards) {
            addCardView(cardView: dataSource.card(forQuestionAtIndex: index), atIndex: index)
        }
        
        if let emptyView = dataSource.viewForEmptyCards() {
            addEdgeConstrainedSubview(view: emptyView)
        }
        
        setNeedsLayout()
    }
    
    private func addCardView(cardView: SwipeableCardView, atIndex index: Int) {
        cardView.delegate = self
        cardView.center = self.center
        setFrame(forCardView: cardView, atIndex: index)
        cardViews.append(cardView)
        /// Insert at index 0 for the newest cards to appear in the back (since we are only showing three at a time and there may be more in the array queue
        insertSubview(cardView, at: 0)
        remainingCards -= 1
    }
    
    // Prepare for container to be filled with new cards upon loading
    private func removeAllCardViews() {
        for cardView in visibleCardViews {
            cardView.removeFromSuperview()
        }
        cardViews = []
    }
    
    /// Set the frame of a card view at given index. Applies a specific horizontal and vertical offset relative to the index in order to create an overlay stack effect on series of cards (each new card added to the back of the pile gets smaller by the same ratio for a descending effect)
    private func setFrame(forCardView cardView: SwipeableCardView, atIndex index: Int) {
        var cardViewFrame = bounds
        let horizontalInset = CGFloat(index) * CardViewContainer.horizontalInset
        let verticalInset = CGFloat(index) * CardViewContainer.verticalInset
        
        cardViewFrame.size.width -= 2 * horizontalInset
        cardViewFrame.origin.x += horizontalInset
        cardViewFrame.origin.y += verticalInset
        
        cardView.frame = cardViewFrame
    }
}
// MARK: - SwipeeableViewDelegate
extension CardViewContainer {

    func didTap(view: SwipeableViewGestures) {
        if let cardView = view as? SwipeableCardView,
           let index = cardViews.firstIndex(of: cardView) {
            delegate?.didSelect(card: cardView, atIndex: index)
        }
    }
    
    func didBeginSwipe(onView view: SwipeableViewGestures) {
        // React to Swipe Began?
    }
    
    //
    func didEndSwipe(onView view: SwipeableViewGestures) {
        
        timesSwiped += 1
        
        guard let dataSource = dataSource else {
            return
        }
        // Remove swiped card
        view.removeFromSuperview()
        
        // Only add a new card if there are cards remaining in queue outside of visible cards
        if remainingCards > 0 {
            /// Calculate new card's index
            let newIndex = dataSource.numberOfCards() - remainingCards
            
            /// Add new card as subview
            addCardView(cardView: dataSource.card(forQuestionAtIndex: newIndex), atIndex: 2)
            
            }
     /// Navigate to results page when user has swiped through all cards in that category
        if timesSwiped == dataSource.numberOfCards() {
            navDelegate?.navigateToNextView()
        }

        // Animate cards from back of the line to front
        /// Update all existing card frames based on new indices, animate frame change to reveal new card from underneath the stack of existing cards
        /// * New subview inserted at origin 0 needs to appear at the back of the line from where user is swiping rather than its default in the front. To reverse the array order of the card indices shown, .reversed() is added to the array of card views
        /// * Now the subview at origin 0 is farthest back in the hierarchy even though the card indeex associated with that view is 2 (the highest index)
        for (cardIndex, cardView) in visibleCardViews.reversed().enumerated() {
            UIView.animate(withDuration: 0.2) {
                cardView.center = self.center
                self.setFrame(forCardView: cardView, atIndex: cardIndex)
                self.layoutIfNeeded()
                
            }
        }
    }
}
