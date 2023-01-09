//
//  HeaderCollectionReusableView.swift
//  WhatDo
//
//  Created by Jacob Perez on 12/30/22.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var labelBackground: UIView!
    
    var category: CDYelpCategory?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupCategoryTitle(category: CDYelpCategory) {
        headerLabel.text = "\(category.alias)"
        
    }
}
