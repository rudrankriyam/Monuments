//
//  MonumentList.swift
//  DAY 021 Composing Complex Interfaces
//
//  Created by Rudrank Riyam on 26/07/19.
//  Copyright © 2019 100DaysOfSwiftUI. All rights reserved.
//

import SwiftUI

struct MonumentList: View {
    @EnvironmentObject var userData: UserData

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $userData.showFavoriteOnly) {
                    Text("Favorites only")
                        .customFont(.caption1)
                }
                ForEach(userData.monument) { monument in
                    if !self.userData.showFavoriteOnly || monument.isFavorite {
                        NavigationLink(destination: MonumentDetail(monument: monument)) {
                            MonumentRow(monument: monument)
                        }
                    }
                }
            }
            .navigationBarTitle("Monuments")
            .accentColor(.primaryColor)
        }
    }
}

#if DEBUG
struct MonumentList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MonumentList().environmentObject(UserData()).preferredColorScheme(.dark)
        }
    }
}
#endif
