//
//  ShowService.swift
//  SOTW
//
//  Created by Daniel Saewitz on 6/9/19.
//  Copyright © 2019 Farktronix. All rights reserved.
//

import SwiftUI

struct SearchResponse: Decodable {
    let items: [Day]
}

class ShowService {
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }
    
    func get(handler: @escaping (Result<[Day], Error>) -> Void) {
        guard let gitUrl = URL(string: "https://20iikcfmr1.execute-api.us-east-1.amazonaws.com/default/sotw-dev-hello") else { return }
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(SearchResponse.self, from: data)
                handler(.success(response.items))
                
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
}
