//
//  CategoryHome.swift
//  DAY 021 Composing Complex Interfaces
//
//  Created by Rudrank Riyam on 26/07/19.
//  Copyright © 2019 100DaysOfSwiftUI. All rights reserved.
//

import SwiftUI

struct RegionHome: View {

    var regions: [String: [Monument]] {
        .init(grouping: monumentData, by: { $0.region.rawValue })
    }

    var featured: [Monument] {
        monumentData.filter { $0.isFeatured }
    }

    @EnvironmentObject var userData: UserData

    @State var showingProfile = false

    var settingsButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "gear")
                .imageScale(.large)
                .accessibility(label: Text("Settings"))
                .padding()
        }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                FeaturedMonuments(monuments: featured)
                    .clipped()
                    .frame(height: 400)
                    .scaledToFill()
                    .padding(.horizontal)

                ForEach(regions.keys.sorted(), id: \.self) { key in
                    RegionRow(categoryName: key, items: self.regions[key]!)
                }
                .listRowInsets(EdgeInsets())
                //
                //                Text("All Monuments")
                //                            .customFont(.caption1)
                //                            .padding(.leading, 15)
                //                            .padding(.top, 10)
                //
                //                ForEach(userData.monument) { monument in
                //                    if !self.userData.showFavoriteOnly || monument.isFavorite {
                //                        NavigationLink(destination: MonumentDetail(monument: monument)) {
                //                            MonumentRow(monument: monument)
                //
                //                        }
                //                    }
                //                }
            }
            .navigationBarTitle("Featured")
            .customFont(.largeTitle)

            .navigationBarItems(trailing: settingsButton)
            .sheet(isPresented: $showingProfile) {
                Text("Settings")
            }
        }
        .foregroundColor(Color.primaryColor)
    }
}

#if DEBUG
struct RegionHome_Previews: PreviewProvider {
    static var previews: some View {
        RegionHome().environmentObject(UserData())
    }
}
#endif

struct FeaturedMonuments: View {
    var monuments: [Monument]
    
    var body: some View {
        VStack {
            monuments[0].image(forSize: 250).resizable().cornerRadius(20)
            Text(monuments[0].name)
        }
    }
}
