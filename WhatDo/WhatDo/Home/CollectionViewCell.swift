//
//  CollectionViewCell.swift
//  WhatDo
//
//  Created by Jacob Perez on 12/27/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
  
    @IBOutlet weak var categoryButton: UIButton!
    
    static let identifier = "categoryCell"
 
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    public func configure(with image: String) {
     
        let image = UIImage(named: image)
        categoryButton.setImage(image, for: .normal)
        categoryButton.imageView?.contentMode = .scaleAspectFit
        self.layer.cornerRadius = 50
        self.layer.masksToBounds = true
//        categoryButton.imageView?.layer.cornerRadius = categoryButton.frame.height / 2
//        categoryButton.layer.masksToBounds = true
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "categoryCell", bundle: nil)
    }
    
}
