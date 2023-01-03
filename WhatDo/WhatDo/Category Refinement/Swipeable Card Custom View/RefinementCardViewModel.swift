//
//  CategoryRefinementCardViewModel.swift
//  WhatDo
//
//  Created by Esther on 1/2/23.
//

import UIKit

protocol RefinementCardViewModel {
    
    // Cards should at least have question label and variable image SF symbol (that indicates which category they selected)
    var leftLabel: String { get }
    var rightLabel: String { get }
//    let color: UIColor?
//    let image: UIImage?
    
}
