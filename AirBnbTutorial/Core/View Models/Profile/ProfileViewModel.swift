//
//  ProfileViewModel.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/28/24.
//

import Foundation
import Combine

struct ProfileItem: Hashable {
    let name: String
    let icon: String
}

@Observable
class ProfileViewModel {
    var items: [ProfileItem]
    
    init(items: [ProfileItem]) {
        self.items = items
    }
}
