//
//  User.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 9/12/24.
//

import Foundation

struct User: Codable {
    let id: Int
    let email: String?
    let firstName: String?
    let lastName: String?
    let dob: String?
    let password: String?
    let address: Address?
    let emergencyContact: EmergencyContact?
}
