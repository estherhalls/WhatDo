//
//  YelpCollectionViewCell.swift
//  WhatDo
//
//  Created by Jacob Perez on 12/29/22.
//

import UIKit

class YelpCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var labelBackgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setup() {
        imageView.backgroundColor = .black
        titleLabel.text = "test"
        subtitleLabel.text = "test"
    }
}
