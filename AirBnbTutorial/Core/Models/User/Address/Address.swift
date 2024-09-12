//
//  Address.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 9/12/24.
//

import Foundation

struct Address: Codable {
    let country: String
    let aptNumber: String?
    let city: String
    let state: String
    let zip: String
}
