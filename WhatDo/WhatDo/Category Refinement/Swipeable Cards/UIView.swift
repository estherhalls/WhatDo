//
//  UIView.swift
//  WhatDo
//
//  Created by Esther on 12/28/22.
//

import UIKit

extension UIView {
    
    // Adds a view as a subview and constrains it to the edges of its new container view
    /// Parameter view: view to add to subview and constrain
    func addEdgeConstrainedSubview(view:UIView) {
        addSubview(view)
        edgeConstrain(subView: view)
    }
    
    // Constrains a given subview to all 4 sides of its containing view with constant of 0
    /// Parameter subView: view to constrain to its container
    func edgeConstrain(subView:UIView) {
        subView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Top
            NSLayoutConstraint(item: subView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .top,
                               multiplier: 1.0,
                               constant: 0),
            // Bottom
            NSLayoutConstraint(item: subView,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .bottom,
                               multiplier: 1.0,
                               constant: 0),
            // Left
            NSLayoutConstraint(item: subView,
                               attribute: .left,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .left,
                               multiplier: 1.0,
                               constant: 0),
            // Right
            NSLayoutConstraint(item: subView,
                               attribute: .right,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .right,
                               multiplier: 1.0,
                               constant: 0)
        ])
    }
}
