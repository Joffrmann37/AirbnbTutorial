//
//  CollapsedPickerViewModel.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 9/17/24.
//

import Foundation
import Combine

@Observable
class CollapsedPickerViewModel {
    var title: String
    var description: String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}
