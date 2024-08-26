//
//  ListingFeaturesViewModel.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/25/24.
//

import Combine

class ListingFeaturesViewModel: ObservableObject {
    var features: [String]
    
    init(features: [String]) {
        self.features = features
    }
}

