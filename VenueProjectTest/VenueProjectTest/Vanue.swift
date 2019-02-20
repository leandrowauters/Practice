//
//  Vanue.swift
//  VenueProjectTest
//
//  Created by Leandro Wauters on 2/8/19.
//  Copyright © 2019 Leandro Wauters. All rights reserved.
//

import Foundation

struct Venue: Codable {
    let response: VenueInfo
}

struct VenueInfo: Codable {
    let venues: [VenueDetails]
}

struct VenueDetails: Codable {
    let id: String
    let name: String
    let location: LocationInfo
    let categories: [CategoryInfo]
    
}

struct LocationInfo: Codable {
    let address: String?
    let crossStreet: String?
    let lat: Double
    let lng: Double
    let distance: Int?
    let postalCode: String?
    let cc: String
    let city: String?
    let state: String
    let country: String
    let formattedAddress: [String]
}
struct CategoryInfo: Codable {
    let name: String
    let pluralName: String
}
