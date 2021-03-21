//
//  TravelDetail.swift
//  DAY 021 Composing Complex Interfaces
//
//  Created by Rudrank Riyam on 26/07/19.
//  Copyright © 2019 100DaysOfSwiftUI. All rights reserved.
//

import SwiftUI

struct TravelDetail: View {
    let travel: Travel
    @State var dataToShow = \Travel.Observation.elevation

    var buttons = [
        ("Elevation", \Travel.Observation.elevation),
        ("Heart Rate", \Travel.Observation.heartRate),
        ("Pace", \Travel.Observation.pace),
    ]

    var body: some View {
        return VStack {
            TravelGraph(travel: travel, path: dataToShow)
                .frame(height: 200, alignment: .center)

            HStack(spacing: 25) {
                ForEach(buttons, id: \.0) { value in
                    Button(action: {
                        self.dataToShow = value.1
                    }) {
                        Text(verbatim: value.0)
                            .font(.system(size: 15))
                            .foregroundColor(value.1 == self.dataToShow
                                ? Color.gray
                                : Color.accentColor)
                            .animation(nil)
                    }
                }
            }
        }
    }
}

#if DEBUG
struct TravelDetail_Previews: PreviewProvider {
    static var previews: some View {
        TravelDetail(travel: travelData[0])
    }
}
#endif
