//
//  TabView.swift
//  DAY 021 Composing Complex Interfaces
//
//  Created by Rudrank Riyam on 04/08/19.
//  Copyright © 2019 100DaysOfSwiftUI. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RegionHome().environmentObject(UserData())
                .tabItem {
                    Image(systemName: "house").resizable() 
                    Text("Home")
                }
                .tag(0)

            MonumentList().environmentObject(UserData())
                .tabItem {
                    Image(systemName: "square.stack")
                    Text("All")
                }
                .tag(1)

            Text("Profile")
                .tabItem {
                    Image(systemName: "clock")
                    Text("History")
                }
                .tag(2)

            Text("Profile")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(3)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(Color.primaryColor)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserData())
    }
}
#endif

extension Color {
    static var primaryColor = Color(UIColor.systemOrange)
}
