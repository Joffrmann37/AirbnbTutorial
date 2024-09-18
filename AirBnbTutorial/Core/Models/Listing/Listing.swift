//
//  Listing.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/26/24.
//

import Foundation

class Root: Codable {
    var listings: [Listing]
}

struct Owner: Codable, Equatable, Hashable {
    let id: Int
    let name: String
    let imgUrl: String
}

struct Coordinate: Codable, Equatable, Hashable {
    let latitude: Double
    let longitude: Double
}

struct Location: Codable, Equatable, Hashable {
    let city: String
    let state: String
    let distance: String
    let coordinates: Coordinate
}

struct Reservation: Codable, Equatable, Hashable {
    let date: String
    let frequency: String
    let price: Int
}

struct Feature: Codable, Equatable, Hashable {
    let type: String
    let detail: String
    let image: String
}

struct Bed: Codable, Equatable, Hashable {
    let title: String
    let detail: String
}

struct Bedding: Codable, Equatable, Hashable {
    let title: String
    let beds: [Bed]
}

struct Amenity: Codable, Equatable, Hashable {
    let image: String
    let detail: String
}

struct AmenityInfo: Codable, Equatable, Hashable {
    let title: String
    let amenities: [Amenity]
}

struct Listing: Identifiable, Codable, Equatable, Hashable {
    let id: Int
    let type: String
    let owner: Owner
    let location: Location
    let reservationInfo: Reservation
    let caption: String
    let images: [String]
    let features: [Feature]
    let bedding: Bedding
    let amenityInfo: AmenityInfo
}
