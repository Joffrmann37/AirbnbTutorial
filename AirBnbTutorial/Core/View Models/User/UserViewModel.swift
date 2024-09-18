//
//  UserViewModel.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 9/12/24.
//

import Foundation
import Combine

@Observable
class UserViewModel {
    var currentUser: User?
    var isLoggedIn = false
    var accessToken: String? = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmF0aW9uIjoxNzI5MTkxOTQ1LjYwMzU4NSwidXNlciI6eyJpZCI6MSwicGhvbmUiOiI2Nzg1OTEwODQ1IiwidmVyaWZpY2F0aW9uQ29kZSI6IjE4NzQ3MiIsImV4cGlyYXRpb25UaW1lc3RhbXAiOjE3MjY1OTk5NTkuMTU3MjQ0LCJlbWFpbCI6Ik5vdCBwcm92aWRlZCIsImZpcnN0TmFtZSI6Ik5vdCBwcm92aWRlZCIsImxhc3ROYW1lIjoiTm90IHByb3ZpZGVkIiwiZG9iIjpudWxsLCJhZGRyZXNzIjpudWxsLCJlbWVyZ2VuY3lDb250YWN0IjpudWxsfX0.KBetg-UBWay-dOdiPoW1DHXE9Y-CeOUGx-RTiv-XicM"
    static let shared = UserViewModel()
    
    private init() {}
    
    func fetchCurrentUser() -> User? {
        guard let accessToken = accessToken else {
            return nil
        }
        
        let json = decode(jwtToken: accessToken)
        var address: Address?
        var emergencyContact: EmergencyContact?
        
        do {
            if let addressDict = json["address"] as? [String: Any] {
                address = Address(country: addressDict["country"] as! String, aptNumber: addressDict["aptNumber"] as? String, city: addressDict["city"] as! String, state: addressDict["state"] as! String, zip: addressDict["zip"] as! String)
            }
            
            if let emergencyContactDict = json["emergencyContact"] as? [String: Any] {
                emergencyContact = EmergencyContact(firstName: emergencyContactDict["firstName"] as! String, lastName: emergencyContactDict["lastName"] as! String, relationship: emergencyContactDict["relationship"] as! String, email: emergencyContactDict["email"] as! String, phone: emergencyContactDict["phone"] as! String, preferredLanguage: emergencyContactDict["preferredLanguage"] as! String)
            }
            
            guard let userDict = json["user"] as? [String: Any] else {
                return nil
            }
            
            let data = try JSONEncoder().encode(User(id: userDict["id"] as! Int, phone: userDict["phone"] as? String, email: userDict["email"] as? String, firstName: userDict["firstName"] as? String, lastName: userDict["lastName"] as? String, dob: userDict["dob"] as? String, address: address, emergencyContact: emergencyContact))
            let user = try JSONDecoder().decode(User.self, from: data)
            print(user)
            return user
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func decode(jwtToken jwt: String) -> [String: Any] {
        let segments = jwt.components(separatedBy: ".")
        return decodeJWTPart(segments[1]) ?? [:]
    }
    
    func base64UrlDecode(_ value: String) -> Data? {
        var base64 = value
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        
        let length = Double(base64.lengthOfBytes(using: String.Encoding.utf8))
        let requiredLength = 4 * ceil(length / 4.0)
        let paddingLength = requiredLength - length
        if paddingLength > 0 {
            let padding = "".padding(toLength: Int(paddingLength), withPad: "=", startingAt: 0)
            base64 = base64 + padding
        }
        return Data(base64Encoded: base64, options: .ignoreUnknownCharacters)
    }
    
    func decodeJWTPart(_ value: String) -> [String: Any]? {
        guard let bodyData = base64UrlDecode(value),
              let json = try? JSONSerialization.jsonObject(with: bodyData, options: []), let payload = json as? [String: Any] else {
            return nil
        }
        
        return payload
    }
}

extension String {
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
}

