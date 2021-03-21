//
//  UserData.swift
//  DAY 021 Composing Complex Interfaces
//
//  Created by Rudrank Riyam on 26/07/19.
//  Copyright © 2019 100DaysOfSwiftUI. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    let willChange = PassthroughSubject<Void, Never>()

    var showFavoriteOnly = false {
        willSet {
            willChange.send()
        }
    }
    
    var monument = monumentData {
        willSet {
            willChange.send()
        }
    }
}
