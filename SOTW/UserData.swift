//
//  UserData.swift
//  SOTW
//
//  Created by Jacob Farkas on 6/7/19.
//  Copyright © 2019 Farktronix. All rights reserved.
//

import SwiftUI
import Combine

final class UserData : BindableObject {
    let didChange = PassthroughSubject<UserData, Never>()
    
    var shows : [Show] = [
        Show(date: Date(), artist: "Marcus King Band", location: "Brooklyn Bowl"),
        Show(date: Date(timeInterval: 60*60*24, since: Date()), artist: "FREE Parquet Courts, Sachiko Kanenobu", location: "Summerstage"),
        Show(date: Date(), artist: "Dead Meadow, Dommengang", location: "The Bell House (Brooklyn)")
        ] {
        didSet {
            didChange.send(self)
        }
    }
    
    var groupedShows : [String : [Show]] {
        get {
            return Dictionary(grouping: self.shows, by: { $0.sectionHeader })
        }
    }
}

extension String : Identifiable {
    public var id: Int {
        get {
            return self.hashValue
        }
    }
}
