//
//  HeaderLargeView.swift
//  WhatDo
//
//  Created by Esther on 12/26/22.
//

import UIKit

// tried @IBDesignable so I don't have to run simulator to see modifications, but it is throwing errors. If you want to try to debug later, add @IBDesignable before class on next line
@IBDesignable class HeaderLargeView: UIView {

    @IBOutlet weak var sfSymbolImage: UIImageView!
    @IBOutlet weak var titleLogoImage: UIImageView!
    @IBOutlet weak var subtitleLogoImage: UIImageView?
    
    var view: UIView!
    
    // When component is initialized via code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubview()
    }
    
    // When Storyboard or another XIB initializes this component
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubview()
    }
    
    func setupSubview() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleTopMargin]
        
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let nib = UINib(nibName: "HeaderLargeView", bundle: nil)
        guard let view = nib.instantiate(withOwner: self)[0] as? UIView else {
            fatalError("Unable to Convert Nib")
        }
        return view
    }
    
//    func configureImageViews(withImages logo: UIImage, title: UIImage, subtitle: UIImage?) {
//        sfSymbolImage.image = logo
//        titleLogoImage.image = title
//        subtitleLogoImage?.image = subtitle
//    }
    func configureImageViews(withImages title: UIImage, subtitle: UIImage?) {
        titleLogoImage.image = title
        subtitleLogoImage?.image = subtitle
    }
    
    

} // End of Class
