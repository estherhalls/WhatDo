//
//  RefinementCardViewController.swift
//  WhatDo
//
//  Created by Esther on 1/2/23.
//

import UIKit

class RefinementCardViewController: SwipeableCardView {

// MARK: - Outlets
    
    var viewModel: RefinementCardViewModel? {
        didSet {
            configure(forViewModel: viewModel)
        }
    }
    
    // MARK: -  Configure Cards
    private func configure(forViewModel viewModel: RefinementCardViewModel?) {
        if let viewModel {
            
        }
    }
    
    
    
    

}

