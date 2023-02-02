//
//  CategoryHeaderView.swift
//  WhatDo
//
//  Created by Esther on 2/1/23.
//

import UIKit

class CategoryHeaderView: UIView {
    @IBOutlet weak var categoryHeaderImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var view: UIView!
    static let identifier = "CategoryHeaderView"
    
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
        let nib = UINib(nibName: CategoryHeaderView.identifier, bundle: nil)
        guard let view = nib.instantiate(withOwner: self)[0] as? UIView else {
            fatalError("Unable to Convert Nib")
        }
        return view
    }
    
    func configureCategoryHeader(with label: String, image: UIImage) {
        categoryLabel.text = label
        categoryHeaderImage.image = image
    }
    
    //    var category: CDYelpCategory?
        
    //    func setupCategoryTitle(categoryTitle: String) {
    //        headerLabel.text = "\(category)"
    //
    //        guard let categoryUrl = category?.self else { return }
    //        fetchSectionTitle(categorySection: category)
    //    }
    //    func fetchSectionTitle(categorySection: String) {
    //        guard let categoryUrl = URL(string: categorySection) else { return }
    //        let request = URLRequest(url: categoryUrl)
    //        APIService().perform(request) { result in
    //            switch result {
    //            case .success(let sectionData):
    //                let category = String(data: sectionData, encoding: String.Encoding.utf8)
    //                DispatchQueue.main.async {
    //                    self.headerLabel.text = category
    //                }
    //            case .failure(let error):
    //                print(error)
    //            }
    //        }
    //
    //    }
}
