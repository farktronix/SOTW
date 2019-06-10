//
//  UserData.swift
//  SOTW
//
//  Created by Jacob Farkas on 6/7/19.
//  Copyright © 2019 Farktronix. All rights reserved.
//

import SwiftUI
import Combine

final class DaysStore : BindableObject {
    let didChange = PassthroughSubject<DaysStore, Never>()
    
    var days: [Day] = [] {
        didSet {
            didChange.send(self)
        }
    }
    
    let service: ShowService
    init(service: ShowService) {
        self.service = service
    }
    
    func fetch() {
        service.get() { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let items): self?.days = items
                    case .failure: self?.days = []
                }
            }
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
