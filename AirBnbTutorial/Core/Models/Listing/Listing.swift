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

struct Listing: Codable, Equatable, Hashable {
    let city: String
    let date: String
    let distance: String
    let frequency: String
    let price: Int
    let state: String
    let caption: String
    let images: [String]
}
