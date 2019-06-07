//
//  ShowRowView.swift
//  SOTW
//
//  Created by Jacob Farkas on 6/7/19.
//  Copyright © 2019 Farktronix. All rights reserved.
//

import SwiftUI

struct ShowRowView : View {
    var show : Show
    
    init(_ show: Show) {
        self.show = show
    }
    
    var body: some View {
        HStack {
            Text(show.artist).font(.headline)
            Spacer()
            Text("@ \(show.location)").font(.subheadline)
        }
    }
}

#if DEBUG
struct ShowRowView_Previews : PreviewProvider {
    static var previews: some View {
        ShowRowView(Show(date: Date(), artist: "Phish", location: "Bill Graham Auditorium"))
    }
}
#endif
