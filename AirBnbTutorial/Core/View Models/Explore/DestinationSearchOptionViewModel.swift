//
//  DestinationSearchOptionViewModel.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 9/18/24.
//

import Foundation
import Combine

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

@Observable
class DestinationSearchOptionViewModel {
    private var options: [DestinationSearchOptions] = [.location, .dates, .guests]
    
    var selectedOption: DestinationSearchOptions = .location
}
