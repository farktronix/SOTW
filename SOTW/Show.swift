//
//  Show.swift
//  SOTW
//
//  Created by Jacob Farkas on 6/7/19.
//  Copyright © 2019 Farktronix. All rights reserved.
//

import Foundation
import SwiftUI

struct Show : Hashable, Codable, Identifiable {
    let date : Date
    let artist : String
    let location : String
    
    var id: Int {
        get {
           return self.date.hashValue ^ self.artist.hashValue ^ self.location.hashValue
        }
    }
    static var dateFormatter: DateFormatter = {
        let d = DateFormatter()
        d.dateFormat = "EEEE (M/d)"
        return d
    }()
    
    var sectionHeader : String {
        get {
            return Show.dateFormatter.string(from: self.date)
        }
    }
}
