//
//  AllShowsViewswift
//  SOTW
//
//  Created by Jacob Farkas on 6/7/19.
//  Copyright © 2019 Farktronix. All rights reserved.
//

import SwiftUI

struct AllShowsView : View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Array(userData.groupedShows.keys.sorted())) { sectionHeader in
                    Section(header: Text("\(sectionHeader)")) {
                        ForEach(self.userData.groupedShows[sectionHeader] ?? []) { show in
                            ShowRowView(show)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Shows Of The Week"))
        }
    }
}

#if DEBUG
struct AllShowsView_Previews : PreviewProvider {
    static var previews: some View {
        AllShowsView().environmentObject(UserData())
    }
}
#endif
