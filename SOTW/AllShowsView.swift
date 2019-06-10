//
//  AllShowsViewswift
//  SOTW
//
//  Created by Jacob Farkas on 6/7/19.
//  Copyright © 2019 Farktronix. All rights reserved.
//

import SwiftUI

struct AllShowsView : View {
    @EnvironmentObject private var daysData: DaysStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(daysData.days) { day in
                    if (day.isVisible) {
                        Section(header: Text("\(day.line)")) {
                            ForEach(day.shows) { show in
                                ShowRowView(show)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Shows Of The Week"))
        }
    }
}

#if DEBUG
//struct AllShowsView_Previews : PreviewProvider {
//    static var previews: some View {
//        AllShowsView().environmentObject(DaysStore())
//    }
//}
#endif
