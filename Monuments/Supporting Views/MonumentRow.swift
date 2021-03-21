//
//  MonumentRow.swift
//  DAY 021 Composing Complex Interfaces
//
//  Created by Rudrank Riyam on 26/07/19.
//  Copyright © 2019 100DaysOfSwiftUI. All rights reserved.
//

import SwiftUI

struct MonumentRow: View {
    var monument: Monument

    var body: some View {
        
        HStack {
            monument.image(forSize: 100)
                .cornerRadius(10)
                .padding(5)
            VStack(alignment: .leading) {
                Text(monument.name)
                    .customFont(.caption1)
                Text(monument.state)
                    .customFont(.callout)
                    .foregroundColor(.secondary)
            }

            Spacer()
            if monument.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(Color.yellow)
            }
        }
    }
}

#if DEBUG
struct MonumentRow_Previews: PreviewProvider {
    static var previews: some View {
        MonumentRow(monument: monumentData[4])
    }
}
#endif
