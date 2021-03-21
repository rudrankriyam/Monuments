//
//  CustomFonts.swift
//  Monuments
//
//  Created by Rudrank Riyam on 05/08/19.
//  Copyright © 2019 Rudrank Riyam. All rights reserved.
//

import SwiftUI

extension View {
    func customFont(_ textStyle: UIFont.TextStyle) -> ModifiedContent<Self, CustomFont> {
        return modifier(CustomFont(textStyle: textStyle))
    }
}

struct CustomFont: ViewModifier {
    let textStyle: UIFont.TextStyle

    /// Will trigger the refresh of the view when the ContentSizeCategory changes.
    @Environment(\.sizeCategory) var sizeCategory: ContentSizeCategory

    func body(content: Content) -> some View {
        guard let fontDescription = fontDescriptions[textStyle] else {
            fatalError()
        }

        let fontMetrics = UIFontMetrics(forTextStyle: textStyle)
        let fontSize = fontMetrics.scaledValue(for: fontDescription.1)

        return content.font(.custom(fontDescription.0, size: fontSize))
    }
}

/// Define the custom fonts to use, depending on the TextStyle.
typealias CustomFontDescription = (String, CGFloat)
private var fontDescriptions: [UIFont.TextStyle: CustomFontDescription] = [
    .largeTitle: ("Optima-ExtraBlack", 28),
    .body: ("Kailasa", 16),
    .caption2: ("Helvetica-Light", 16),
    .caption1: ("Avenir-Book", 20),
    .callout: ("Avenir-Light", 16)
    
    // ... other styles
]
