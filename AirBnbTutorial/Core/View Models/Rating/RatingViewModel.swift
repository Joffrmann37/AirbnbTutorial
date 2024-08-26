//
//  RatingViewModel.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/18/24.
//

import SwiftUI

@Observable
class RatingViewModel {
    var rating: String
    var numOfReviews: Int
    
    init(rating: String, numOfReviews: Int) {
        self.rating = rating
        self.numOfReviews = numOfReviews
    }
}

