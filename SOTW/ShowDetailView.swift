//
//  ShowDetailView.swift
//  SOTW
//
//  Created by Daniel Saewitz on 6/10/19.
//  Copyright © 2019 Farktronix. All rights reserved.
//

import SwiftUI
import MapKit

struct ShowDetailView : View {
    var show: Show
    
    var body: some View {
        VStack {
            ShowDetailMapView()
                .frame(height: 300)
            
            VStack(alignment: .leading) {
                Text(show.band)
                    .font(.headline)
                HStack(alignment: .top) {
                    Text(show.metadata)
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
            }
        }.navigationBarTitle(Text(show.band))
    }
}

#if DEBUG
struct ShowDetailView_Previews : PreviewProvider {
    static var previews: some View {
        ShowDetailView(show: Show(line: "band", band: "band", metadata: "venue", isAsterisked: true))
    }
}
#endif
