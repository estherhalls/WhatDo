//
//  CardViewDelegate.swift
//  WhatDo
//
//  Created by Esther on 12/28/22.
//

import Foundation

protocol CardViewDelegate: AnyObject {
    func didSelect(card: SwipeableCardView, atIndex index: Int)
}
