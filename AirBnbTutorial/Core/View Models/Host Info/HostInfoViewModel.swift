//
//  HostInfoViewModel.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/18/24.
//

import Combine

class HostInfoViewModel: ObservableObject {
    @Published var name: String
    @Published var numOfGuests: Int
    @Published var numOfBedrooms: Int
    @Published var numOfBeds: Int
    @Published var numOfBaths: Int
    @Published var profilePic: String
    
    init(name: String, numOfGuests: Int, numOfBedrooms: Int, numOfBeds: Int, numOfBaths: Int, profilePic: String) {
        self.name = name
        self.numOfGuests = numOfGuests
        self.numOfBedrooms = numOfBedrooms
        self.numOfBeds = numOfBeds
        self.numOfBaths = numOfBaths
        self.profilePic = profilePic
    }
}
