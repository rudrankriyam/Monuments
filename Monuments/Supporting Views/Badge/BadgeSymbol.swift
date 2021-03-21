//
//  BadgeSymbol.swift
//  DAY 021 Composing Complex Interfaces
//
//  Created by Rudrank Riyam on 26/07/19.
//  Copyright © 2019 100DaysOfSwiftUI. All rights reserved.
//

import SwiftUI

struct BadgeSymbol: View {
    static let symbolColor = Color(red: 243.0 / 255, green: 114.0 / 255, blue: 32.0 / 255)

    var body: some View {
        
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 1.0
                let spacing = width * 0.040
                let middle = width / 2
                let topWidth = 0.326 * width
                let topHeight = 0.488 * height

                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: topHeight / 1 + spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: spacing)
                ])

                path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
                path.addLines([
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: spacing, y: height - spacing),
                    CGPoint(x: width - spacing, y: height - spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: topHeight / 1 + spacing * 3)
                ])
            }
            .fill(LinearGradient(
                gradient: .init(colors: [Self.symbolColor, Color.red]),
                    startPoint: .init(x: 0.5, y: 0),
            endPoint: .init(x: 0.5, y: 0.6)
            ))
        }
    }
}

#if DEBUG
struct BadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        BadgeSymbol()
    }
}
#endif
