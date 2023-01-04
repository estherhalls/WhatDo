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
    let whatDoRed: UIColor = UIColor(red: 0.80, green: 0.16, blue: 0.05, alpha: 1.00)
//    let whatDoRed : UIColor(red:202.0/255.0, green:228.0/255.0, blue:230.0/255.0, alpha:1.0)
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    public func configure(with image: String) {
     
        let image = UIImage(named: image)
        categoryImage.image = image
        categoryImage.clipsToBounds = true
        self.layer.cornerRadius = 50
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1.5
//        self.layer.borderColor = whatDoRed.cgColor
       
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "categoryCell", bundle: nil)
    }
    
    @IBAction func categoryButtonTapped(_ sender: AnyObject) {
        self.inputViewController?.performSegue(withIdentifier: CollectionViewCell.identifier, sender: AnyObject.self)
        print("Take me there!")
    }
}
