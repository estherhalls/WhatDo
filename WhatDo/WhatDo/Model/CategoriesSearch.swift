//
//  CategoriesSearch.swift
//  WhatDo
//
//  Created by Jacob Perez on 2/3/23.
//

import Foundation

struct CategoryTLD: Decodable {
    let categories: [CategoriesSearch]
}
struct CategoriesSearch: Decodable {
    enum CodingKeys: String, CodingKey {
        case alias
        case title
        case parentAliases = "parent_aliases"
        case countryWhitelist = "country_whitelist"
        case countryBlacklist = "country_blacklist"
    }
    let alias: String
    let title: String
    let parentAliases: [String]
    let countryWhitelist: [String]
    let countryBlacklist: [String]
}
    //{
    //    "categories": [
    //        {
    //            "alias": "3dprinting",
    //            "title": "3D Printing",
    //            "parent_aliases": [
    //                "localservices"
    //            ],
    //            "country_whitelist": [],
    //            "country_blacklist": []
    //        },
    //        {
    //            "alias": "abruzzese",
    //            "title": "Abruzzese",
    //            "parent_aliases": [
    //                "italian"
    //            ],
    //            "country_whitelist": [
    //                "IT"
    //            ],
    //            "country_blacklist": []
    //        },
    //        {
    //            "alias": "absinthebars",
    //            "title": "Absinthe Bars",
    //            "parent_aliases": [
    //                "bars"
    //            ],
    //            "country_whitelist": [
    //                "CZ"
    //            ],
    //            "country_blacklist": []
    //        }
//    }
