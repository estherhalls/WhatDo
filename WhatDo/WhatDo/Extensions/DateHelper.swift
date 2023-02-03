//
//  DateHelper.swift
//  WhatDo
//
//  Created by Jacob Perez on 1/25/23.
//

import Foundation

extension String {
    // Converting 2400 time, no :, to 12:00 time
    func timeConverter() -> String {
        var foo = self
        foo.insert(":", at: foo.index(foo.startIndex, offsetBy: 2))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        print(self)
        let date = dateFormatter.date(from: foo)
        print(date)
        dateFormatter.dateFormat = "h:mm a"
        let date12 = dateFormatter.string(from: date!)
        return date12
    }
}
