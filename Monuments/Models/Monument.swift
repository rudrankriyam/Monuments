//
//  Monument.swift
//  DAY 021 Composing Complex Interfaces
//
//  Created by Rudrank Riyam on 26/07/19.
//  Copyright © 2019 100DaysOfSwiftUI. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Monument: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var city: String
    var state: String
    var information: String
    var region: Region
    var fee: String
    var closestLocation: String
    var timing: String
    var isFavorite: Bool
    var isFeatured: Bool

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    func image(forSize size: Int) -> Image {
        ImageStore.shared.image(name: imageName, size: size)
    }

    enum Region: String, CaseIterable, Codable, Hashable {
        case north = "North"
        case east = "East"
        case west = "West"
        case south = "South"
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
