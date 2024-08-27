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

struct Listing: Codable, Equatable, Hashable {
    let city: String
    let date: String
    let distance: String
    let frequency: String
    let price: Int
    let state: String
    let caption: String
    let images: [String]
    let features: [Feature]
    let bedding: Bedding
}
