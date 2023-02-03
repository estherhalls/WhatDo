//
//  HeaderCollectionReusableView.swift
//  WhatDo
//
//  Created by Jacob Perez on 12/30/22.
//

import UIKit

class SectionCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var labelBackground: UIView!
    

    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupCategoryTitle(categoryTitle: String) {
        headerLabel.text = categoryTitle
//        
//        guard let categoryUrl = category?.self else { return }
//        fetchSectionTitle(categorySection: category)
    }
    func fetchSectionTitle(categorySection: String) {
        guard let categoryUrl = URL(string: categorySection) else { return }
        let request = URLRequest(url: categoryUrl)
        APIService().perform(request) { result in
            switch result {
            case .success(let sectionData):
                let category = String(data: sectionData, encoding: String.Encoding.utf8)
                DispatchQueue.main.async {
                    self.headerLabel.text = category
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
