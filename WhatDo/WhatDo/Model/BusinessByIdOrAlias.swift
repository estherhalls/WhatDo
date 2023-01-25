//
//  BusinessById.swift
//  WhatDo
//
//  Created by Jacob Perez on 1/2/23.
//

import Foundation

// TopLevelDictionary
struct BusinessByIdOrAlias: Decodable {
    let hours: [Hours]?
}
struct Hours: Decodable {
    enum CodingKeys: String, CodingKey {
        case open
        case hoursType = "hours_type"
        case isOpenNow = "is_open_now"
    }
    let open: [Open]?
    let hoursType: String?
    let isOpenNow: Bool?
}
struct Open: Decodable {
    enum CodingKeys: String, CodingKey {
        case isOvernight = "is_overnight"
        case start
        case end
        case day
    }
    let isOvernight: Bool?
    let start: String?
    let end: String?
    let day: Int?
}
//struct SpecialHours: Decodable {
//    enum CodingKeys: String, CodingKey {
//        case specialHours = "special_hours"
//        case date
//        case isClosed = "is_closed"
//    }
//    let specialHours: [String]?
//    let date: String?
//    let isClosed: String?
//}
//
//struct Location: Decodable {
//enum CodingKeys: String, CodingKey {
//    case address1
//    case address2
//    case address3
//    case city
//    case zipCode = "zip_code"
//    case country
//    case state
//    case displayAddress = "display_address"
//}
//    let address1: String?
//    let address2: String?
//    let address3: String?
//    let city: String?
//    let zipCode: String?
//    let country: String?
//    let state: String?
//    var displayAddress = [String]()
//}
//struct CrossStreets: Decodable {
//    enum CodingKeys: String, CodingKey {
//        case crossStreets = "cross_streets"
//    }
//    let crossStreets: String?
//}


//{
//  "id": "BcW0vRdM8N-rteR2FfV1jg",
//  "alias": "deli-board-san-francisco",
//  "name": "Deli Board",
//  "image_url": "https://s3-media3.fl.yelpcdn.com/bphoto/M18j9Ha-nNDVEjyoOqEV0A/o.jpg",
//  "is_claimed": true,
//  "is_closed": false,
//  "url": "https://www.yelp.com/biz/deli-board-san-francisco?adjust_creative=VY0OR1Hr3KZ7TL1GwHQang&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_lookup&utm_source=VY0OR1Hr3KZ7TL1GwHQang",
//  "phone": "+14155527687",
//  "display_phone": "(415) 552-7687",
//  "review_count": 1589,
//  "categories": [
//    {
//      "alias": "delis",
//      "title": "Delis"
//    },
//    {
//      "alias": "sandwiches",
//      "title": "Sandwiches"
//    }
//  ],
//  "rating": 4.5,
//  "location": {
//    "address1": "1058 Folsom St",
//    "address2": "",
//    "address3": "",
//    "city": "San Francisco",
//    "zip_code": "94103",
//    "country": "US",
//    "state": "CA",
//    "display_address": [
//      "1058 Folsom St",
//      "San Francisco, CA 94103"
//    ],
//    "cross_streets": "Russ St & Sherman St"
//  },
//  "coordinates": {
//    "latitude": 37.7776247966103,
//    "longitude": -122.407012712007
//  },
//  "photos": [
//    "https://s3-media3.fl.yelpcdn.com/bphoto/M18j9Ha-nNDVEjyoOqEV0A/o.jpg",
//    "https://s3-media2.fl.yelpcdn.com/bphoto/6VGTv44vyGC8catsWNzUIw/o.jpg",
//    "https://s3-media4.fl.yelpcdn.com/bphoto/KOVrVcqgZsz4sZ-j5ZOMkQ/o.jpg"
//  ],
//  "price": "$$",
//  "hours": [
//    {
//      "open": [
//        {
//          "is_overnight": false,
//          "start": "1100",
//          "end": "1500",
//          "day": 1
//        },
//        {
//          "is_overnight": false,
//          "start": "1100",
//          "end": "1500",
//          "day": 2
//        },
//        {
//          "is_overnight": false,
//          "start": "1100",
//          "end": "1500",
//          "day": 3
//        },
//        {
//          "is_overnight": false,
//          "start": "1100",
//          "end": "1500",
//          "day": 4
//        },
//        {
//          "is_overnight": false,
//          "start": "1100",
//          "end": "1500",
//          "day": 5
//        },
//        {
//          "is_overnight": false,
//          "start": "1100",
//          "end": "1500",
//          "day": 6
//        }
//      ],
//      "hours_type": "REGULAR",
//      "is_open_now": false
//    }
//  ],
//  "transactions": [
//    "delivery"
//  ],
//  "special_hours": [
//    {
//      "date": "2023-01-01",
//      "is_closed": true,
//      "start": null,
//      "end": null,
//      "is_overnight": null
//    },
//    {
//      "date": "2023-01-02",
//      "is_closed": true,
//      "start": null,
//      "end": null,
//      "is_overnight": null
//    }
//  ]
//}
