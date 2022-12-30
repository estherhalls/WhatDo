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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setup() {
        headerLabel.text = "test"
    }
}
