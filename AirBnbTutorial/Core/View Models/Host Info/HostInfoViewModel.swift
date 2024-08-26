//
//  HostInfoViewModel.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/18/24.
//

import SwiftUI

@Observable
class HostInfoViewModel {
    var name: String
    var numOfGuests: Int
    var numOfBedrooms: Int
    var numOfBeds: Int
    var numOfBaths: Int
    var profilePic: String
    
    init(name: String, numOfGuests: Int, numOfBedrooms: Int, numOfBeds: Int, numOfBaths: Int, profilePic: String) {
        self.name = name
        self.numOfGuests = numOfGuests
        self.numOfBedrooms = numOfBedrooms
        self.numOfBeds = numOfBeds
        self.numOfBaths = numOfBaths
        self.profilePic = profilePic
    }
}
