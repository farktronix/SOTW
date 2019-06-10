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
        VStack.init(alignment: .leading) {
            Text("\(show.isAsterisked ? "* " : "")\(show.band)").font(.headline)
            Text("@\(show.metadata)").font(.footnote)
        }
    }
}

#if DEBUG
struct ShowRowView_Previews : PreviewProvider {
    static var previews: some View {
        ShowRowView(Show(line: "Phish", band: "Phish", metadata: "Bill Graham Auditorium", isAsterisked: false))
    }
}
#endif
