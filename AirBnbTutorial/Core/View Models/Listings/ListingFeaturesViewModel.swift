//
//  ListingFeaturesViewModel.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/25/24.
//

import Combine
import SwiftUI

@Observable
class ListingFeaturesViewModel {
    var features: [String]
    
    init(features: [String]) {
        self.features = features
    }
}

