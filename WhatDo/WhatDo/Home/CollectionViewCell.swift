//
//  CollectionViewCell.swift
//  WhatDo
//
//  Created by Jacob Perez on 12/27/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var categoryImage: UIImageView!
    
    static let identifier = "categoryCell"
 
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    public func configure(with image: String) {
     
        let image = UIImage(named: image)
        categoryImage.image = image
//        categoryImage.image.contentMode = .scaleAspectFit
        categoryImage.clipsToBounds = true
        self.layer.cornerRadius = 50
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.systemRed.cgColor
       
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "categoryCell", bundle: nil)
    }
    
    @IBAction func categoryButtonTapped(_ sender: AnyObject) {
        self.inputViewController?.performSegue(withIdentifier: CollectionViewCell.identifier, sender: AnyObject.self)
        print("Take me there!")
    }
}
