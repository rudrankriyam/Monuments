//
//  RegionRow.swift
//  DAY 021 Composing Complex Interfaces
//
//  Created by Rudrank Riyam on 26/07/19.
//  Copyright © 2019 100DaysOfSwiftUI. All rights reserved.
//

import SwiftUI

struct RegionRow: View {
    var categoryName: String
    var items: [Monument]

    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .customFont(.caption1)
                .padding(.leading, 15)
                .padding(.top, 10)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { monument in
                        NavigationLink(destination: MonumentDetail(monument: monument)) {
                            RegionItem(monument: monument)
                        }
                    }
                }
            }
        }
    }
}

#if DEBUG
struct RegionRow_Previews: PreviewProvider {
    static var previews: some View {
        RegionRow(categoryName: monumentData[0].region.rawValue,
                  items: Array(monumentData.prefix(4)))
    }
}
#endif

struct RegionItem: View {

    var monument: Monument
    var body: some View {
        VStack {
            monument
                .image(forSize: 180)
                .renderingMode(.original)
                .cornerRadius(20)
            Text(monument.name)
                .foregroundColor(.primary)
                .customFont(.caption2)
                .padding(.vertical, 10)
        }
        .padding(.leading, 15)
    }
}
