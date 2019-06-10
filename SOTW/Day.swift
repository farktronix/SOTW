//
//  Day.swift
//  SOTW
//
//  Created by Daniel Saewitz on 6/9/19.
//  Copyright © 2019 Farktronix. All rights reserved.
//

import Foundation
import SwiftUI

struct Day : Hashable, Codable, Identifiable {
    let line: String
    let date: String
    let shows: [Show]
    
    var id: Int {
        get {
            return self.line.hashValue ^ self.date.hashValue
        }
    }
    
    var realDate: Date {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
            let date = dateFormatter.date(from: self.date)
            
            return date ?? Date.init();
        }
    }
    
    // isVisible if day is within next day's ~4am (show all shows on the previous day up to ~4am)
    // TODO: fix poorly hard-coded timezone conversion
    var isVisible: Bool {
        get {
            let calendar = Calendar.current
            let currentDate = Date.init()
            // 24 hour for 1 day, 4 hours to get to 4 am, and 5 hours to poorly convert GMT to EST
            if let date = calendar.date(byAdding: .hour, value: 24 + 4 + 5, to: self.realDate) {
                return currentDate < date;
            }

            return true
        }
    }
}
