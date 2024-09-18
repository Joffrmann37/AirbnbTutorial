//
//  User.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 9/12/24.
//

import Foundation

class LoginResponse: Codable {
    let success: Bool
    let accessToken: String
    let refreshToken: String
}

class SignupResponse: Codable, Equatable {
    let success: Bool
    let phone: String
    let verificationCode: String
    
    static func == (lhs: SignupResponse, rhs: SignupResponse) -> Bool {
        return lhs.phone == rhs.phone && lhs.verificationCode == rhs.verificationCode
    }
}

class UserRequest: Codable {
    let phone: String?
    let verificationCode: String?
    let email: String?
    let firstName: String?
    let lastName: String?
    let dob: String?
    let password: String?
    let address: Address?
    let emergencyContact: EmergencyContact?
    
    init(phone: String?, verificationCode: String?, email: String?, firstName: String?, lastName: String?, dob: String?, password: String?, address: Address?, emergencyContact: EmergencyContact?) {
        self.phone = phone
        self.verificationCode = verificationCode
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.dob = dob
        self.password = password
        self.address = address
        self.emergencyContact = emergencyContact
    }
}

class User: Codable {
    let id: Int
    let phone: String?
    let email: String?
    let firstName: String?
    let lastName: String?
    let dob: String?
    let address: Address?
    let emergencyContact: EmergencyContact?
    
    init(id: Int, phone: String?, email: String?, firstName: String?, lastName: String?, dob: String?, address: Address?, emergencyContact: EmergencyContact?) {
        self.id = id
        self.phone = phone
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.dob = dob
        self.address = address
        self.emergencyContact = emergencyContact
    }
}
