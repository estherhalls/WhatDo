//
//  UnitConversion.swift
//  WhatDo
//
//  Created by Esther on 2/1/23.
//

import Foundation

struct UnitConversion {
    func metersToMiles(meters: Double) -> Int {
        
        let distanceValue = Double(round(meters))
        let meters = distanceValue
        let metersToMiles = meters.convert(from: .meters, to: .miles)
        let roundedMiles = Int(metersToMiles)
        return roundedMiles
    }
}

extension Double {
    func convert(from originalUnit: UnitLength, to convertedUnit: UnitLength) -> Double {
        return Measurement(value: self, unit: originalUnit).converted(to: convertedUnit).value
    }
}
