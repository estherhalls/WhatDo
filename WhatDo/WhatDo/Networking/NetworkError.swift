//
//  NetworkError.swift
//  WhatDo
//
//  Created by Jacob Perez on 1/2/23.
//

import Foundation
// Abstracted custom errors
enum NetworkError: Error, LocalizedError {
    
    case invalidURL(String)
    case requestError(Error)
    case noData
    case unableToDecode
    case noUser
    
    var errorDescription: String? {
        switch self {
        case .invalidURL(let url):
            return "Unable to reach the server. Please try again.\(url)"
        case .requestError(let error):
            return "Error: \(error.localizedDescription) -> \(error)"
        case .noData:
            return "The server responded with no data. Please try again."
        case .unableToDecode:
            return "The server responded with bad data. Please try again."
        case .noUser:
            return "Do you need to sign in?"
        }
    }
} // End of Enum
