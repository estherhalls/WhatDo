//
//  CollectionViewCell.swift
//  WhatDo
//
//  Created by Jacob Perez on 12/27/22.
//

import UIKit

// Protocol Declaration:
protocol CollectionViewCellDelegate: AnyObject {
    func categoryCellTapped(cell: CollectionViewCell)
}
class CollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    // MARK: - Properties
    static let identifier = "categoryCell"
    
    weak var delegate: CollectionViewCellDelegate?
    
    var category: Category?
    
    /// RGBA for our app red color hex #CC290C (#20441121 for 8-digit RGBA hex)
    let whatDoRed: UIColor = UIColor(red: 0.80, green: 0.16, blue: 0.05, alpha: 1.00)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
                        
    // MARK: - Methods
    public func configure(with category: Category) {
        self.category = category
        let image = UIImage(named: category.imageName)
        categoryImage.image = image
        categoryImage.clipsToBounds = true
        categoryLabel.text = category.name
        self.layer.cornerRadius = 50
        self.layer.masksToBounds = true
        self.layer.borderWidth = 2.0
        self.layer.borderColor = whatDoRed.cgColor
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "categoryCell", bundle: nil)
    }
    
    @IBAction func categoryButtonTapped(_ sender: AnyObject) {
        delegate?.categoryCellTapped(cell: self)
//        self.inputViewController?.performSegue(withIdentifier: CollectionViewCell.identifier, sender: AnyObject.self)
//        print("Take me there!, \(self.category)")

    }
}
