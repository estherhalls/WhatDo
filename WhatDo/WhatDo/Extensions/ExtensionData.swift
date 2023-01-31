//
//  ExtensionData.swift
//  WhatDo
//
//  Created by Jacob Perez on 1/2/23.
//

import Foundation
// Extending Data to decode any type so long it conforms to the Decodable protocol
extension Data {
    func decode<T: Decodable>(type: T.Type, decoder: JSONDecoder = JSONDecoder()) throws -> T {
        do {
            return try decoder.decode(type.self, from: self)
        } catch {
            throw error
        }
    }
}
