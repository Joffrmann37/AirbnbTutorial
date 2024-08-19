//
//  RatingView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/18/24.
//

import SwiftUI

struct RatingView: View {
    @ObservedObject var vm: RatingViewModel
    
    var body: some View {
        // rating
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
            Text(vm.rating)
            Text(" - ")
            Text("\(vm.numOfReviews) reviews")
                .underline()
                .fontWeight(.semibold)
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    RatingView(vm: RatingViewModel(rating: "4.86", numOfReviews: 28))
}
