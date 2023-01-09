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

    var business: BusinessSearch?
    var cellViewModel = YelpCollectionViewCellVM()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupBusinessCell(business: BusinessSearch) {
        

        titleLabel.text = business.name
        let distance = cellViewModel.convertMetersToMiles(distance: business.distance!)
        print(distance)
        subtitleLabel.text =  "Miles: \(distance)"
        guard let imageUrl = business.imageUrl else { return }
        fetchImage(imageString: imageUrl)
    }
    func fetchImage(imageString: String) {
        guard let imageUrl = URL(string: imageString) else { return }
        let request = URLRequest(url: imageUrl)
        APIService().perform(request) { result in
            switch result {
            case .success(let imageData):
                let image = UIImage(data: imageData)
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            case .failure(let error):
                print(error)
            }
        }

    }
}
