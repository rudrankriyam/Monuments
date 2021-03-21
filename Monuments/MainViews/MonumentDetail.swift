//
//  ContentView.swift
//  DAY 021 Composing Complex Interfaces
//
//  Created by Rudrank Riyam on 26/07/19.
//  Copyright © 2019 100DaysOfSwiftUI. All rights reserved.
//

import SwiftUI

enum SubInformationTitle: String {
    case entryFee = "Entry Fee"
    case timing = "Time to Visit"
    case toReach = "How to Reach"
    case description = "Description"
}

struct MonumentDetail: View {
    @EnvironmentObject var userData: UserData
    var monument: Monument

    var monumentIndex: Int {
        userData.monument.firstIndex(where: { $0.id == monument.id })!
    }

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                MapView(coordinate: monument.locationCoordinate)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 300)

                CircleImage(image: monument.image(forSize: 250))
                    .offset(y: -150)
                    .padding(.bottom, -150)

                VStack(alignment: .leading) {
                    HStack {
                        Text(monument.name)
                            .customFont(.largeTitle)

                        Button(action: {
                            self.userData.monument[self.monumentIndex].isFavorite.toggle()
                        }) {
                            if self.userData.monument[self.monumentIndex].isFavorite {
                                Image(systemName: "star.fill")
                                    .font(.title)
                                    .foregroundColor(.yellow)
                            } else {
                                Image(systemName: "star")
                                    .font(.title)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    HStack(alignment: .center) {
                        Text(monument.city)
                        Spacer()
                        Text(monument.state)
                    }
                    .padding(.bottom)
                    .customFont(.caption1)
                }
                .padding(.horizontal)

                SubInformationView(subTitle: .description, subBody: monument.information)
                SubInformationView(subTitle: .entryFee, subBody: monument.fee)
                SubInformationView(subTitle: .timing, subBody: monument.timing)
                SubInformationView(subTitle: .toReach, subBody: monument.closestLocation)
            }
        }
        .navigationBarTitle(Text(monument.name), displayMode: .inline)
        .background(Color(UIColor.systemGroupedBackground))

        .edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
struct MonumentDetail_Previews: PreviewProvider {
    static var previews: some View {
        MonumentDetail(monument: UserData().monument[2]).environmentObject(UserData())

    }
}
#endif

struct SubInformationView: View {
    var subTitle: SubInformationTitle
    var subBody: String

    var body: some View {
        VStack {
            Text(subTitle.rawValue)
                .font(.headline)
                .padding(.bottom, 5)
                .foregroundColor(Color.primaryColor)
            Text(subBody)

        }
        .frame(maxWidth: .infinity, alignment: .center)
        .cardModifier()
    }
}

extension View {
    func cardModifier() -> some View {
        return modifier(CardModifier())
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .customFont(.caption2)
            .foregroundColor(.primary)
            .background(
                Rectangle()
                    .foregroundColor(Color(UIColor.secondarySystemGroupedBackground))
                    .cornerRadius(20))
            .lineSpacing(5)
            .multilineTextAlignment(.center)
            .padding([.horizontal, .bottom])
    }
}
