//
//  SwipeableCardView.swift
//  WhatDo
//
//  Created by Esther on 12/28/22.
//

import UIKit

/// A base UIView subclass that instaniates a view from a nib file of the same name in order to allow reusable views to be created
class SwipeableCardView: SwipeableViewGestures {
    
    // MARK: -  Nib init
    
    // When component is initialized via code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubview()
    }
    
    // When Storyboard or another XIB initializes this component
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubview()
    }
    
    func setupSubview() {
        backgroundColor = .clear
        let view = loadViewFromNib()
        addEdgeConstrainedSubview(view: view)
    }
    
    // Loads view from xib file, returns an instantiated view from the nib file of the same class name
    func loadViewFromNib<T: UIView>() -> T {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? T else {
            fatalError("Cannot instantiate a UIView from the nib for class \(type(of: self))")
        }
        return view
    }

}

