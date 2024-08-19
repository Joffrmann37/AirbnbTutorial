//
//  RatingViewModel.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/18/24.
//

import Combine

class RatingViewModel: ObservableObject {
    @Published var rating: String
    @Published var numOfReviews: Int
    
    init(rating: String, numOfReviews: Int) {
        self.rating = rating
        self.numOfReviews = numOfReviews
    }
}

