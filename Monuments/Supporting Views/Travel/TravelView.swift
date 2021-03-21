//
//  TravelView.swift
//  DAY 021 Composing Complex Interfaces
//
//  Created by Rudrank Riyam on 26/07/19.
//  Copyright © 2019 100DaysOfSwiftUI. All rights reserved.
//

import SwiftUI

struct TravelView: View {
    var travel: Travel
    @State private var showDetail = false
    
    var body: some View {
        VStack {
            HStack {
                TravelGraph(travel: travel, path: \.elevation)
                    .frame(width: 50, height: 30)
                    .animation(nil)
                
                VStack(alignment: .leading) {
                    Text(verbatim: travel.name)
                        .font(.headline)
                    Text(verbatim: travel.distanceText)
                }
                
                Spacer()

                Button(action: {
                    self.showDetail.toggle()
                }) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .padding()
                }
            }

            if showDetail {
                TravelDetail(travel: travel)
            }
        }
    }
}

#if DEBUG
struct TravelView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TravelView(travel: travelData[0])
                .padding()
            Spacer()
        }
    }
}
#endif
