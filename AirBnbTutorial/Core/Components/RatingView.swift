//
//  RatingView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/18/24.
//

import SwiftUI

struct RatingVMKey: EnvironmentKey {
    static var defaultValue = RatingViewModel(rating: "4.86", numOfReviews: 28)
}

private extension EnvironmentValues {
    var vm: RatingViewModel {
        get { self[RatingVMKey.self] }
        set { self[RatingVMKey.self] = newValue }
    }
}

struct RatingView: View {
    @Environment(\.vm) var vm
    
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
        .environment(RatingViewModel(rating: "4.86", numOfReviews: 28))
        .foregroundStyle(.black)
    }
}

#Preview {
    RatingView()
        .environment(RatingViewModel(rating: "4.86", numOfReviews: 28))
}
