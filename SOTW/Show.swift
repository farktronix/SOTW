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
    let line: String
    let band: String
    let metadata: String
    let isAsterisked: Bool
    
    var id: Int {
        get {
           return self.line.hashValue ^ self.band.hashValue ^ self.metadata.hashValue
        }
    }
}
