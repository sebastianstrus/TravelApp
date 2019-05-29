//
//  Date+Extension.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-28.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import Foundation

extension Date {
    func formatedString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: self)
    }
}
