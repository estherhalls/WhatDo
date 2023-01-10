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
    
    var category: CDYelpCategory?
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupCategoryTitle(categoryTitle: String) {
        headerLabel.text = "\(category)"
        
//        guard let categoryUrl = category?.self else { return }
//        fetchSection(categorySection: categoryUrl)
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
