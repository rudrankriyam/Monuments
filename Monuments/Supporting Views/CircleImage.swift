//
//  CircleImage.swift
//  DAY 021 Composing Complex Interfaces
//
//  Created by Rudrank Riyam on 26/07/19.
//  Copyright © 2019 100DaysOfSwiftUI. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .frame(width: 250, height: 250)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
}

#if DEBUG
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image(uiImage: UIImage(named: "indiagate")!))
    }
}
#endif
