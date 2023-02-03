//
//  Category.swift
//  WhatDo
//
//  Created by Esther on 2/2/23.
//

import UIKit

class Category {
    var name: String
    var imageName: String
    var headerImage: String?
    var sfSymbol: UIImage
    var sfSymbol2: UIImage?
    var sfSymbol3: UIImage?
    var refinementQuestions: [RefinementCardViewModel]
    
    init(name: String, imageName: String, headerImage: String? = nil, sfSymbol: UIImage, sfSymbol2: UIImage? = nil, sfSymbol3: UIImage? = nil, refinementQuestions: [RefinementCardViewModel]) {
        self.name = name
        self.imageName = imageName
        self.headerImage = headerImage
        self.sfSymbol = sfSymbol
        self.sfSymbol2 = sfSymbol2
        self.sfSymbol3 = sfSymbol3
        self.refinementQuestions = refinementQuestions
    }
}
 
