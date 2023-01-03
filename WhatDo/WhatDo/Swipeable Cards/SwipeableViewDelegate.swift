//
//  SwipeableViewDelegate.swift
//  WhatDo
//
//  Created by Esther on 12/28/22.
//

import Foundation

protocol SwipeableViewDelegate: AnyObject {
    
    func didTap(view: SwipeableViewGestures)
    
    func didBeginSwipe(onView view: SwipeableViewGestures)
    
    func didEndSwipe(onView view: SwipeableViewGestures)
}
