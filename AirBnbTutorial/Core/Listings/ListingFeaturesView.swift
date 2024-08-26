//
//  ListingFeaturesView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/25/24.
//

import SwiftUI

struct ListingFeaturesVMKey: EnvironmentKey {
    static var defaultValue = ListingFeaturesViewModel(features: [
        "Superhosts are experienced, highly rated hosts who are committed to providing greeat starts for guests",
        "Superhosts are experienced, highly rated hosts who are committed to providing greeat starts for guests"
    ])
}

extension EnvironmentValues {
    var vm: ListingFeaturesViewModel {
        get { self[ListingFeaturesVMKey.self] }
        set { self[ListingFeaturesVMKey.self] = newValue }
    }
}

//  listing features
struct ListingFeaturesView: View {
    @Environment(\.vm) var vm
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(0..<2) { feature in
                HStack(spacing: 12) {
                    Image(systemName: "medal")
                    
                    VStack(alignment: .leading) {
                        Text("Superhost")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Text("Superhosts are experienced, highly rated hosts who are committed to providing greeat starts for guests")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                }
            }
        }
        .environment(ListingFeaturesViewModel(features: [
            "Superhosts are experienced, highly rated hosts who are committed to providing greeat starts for guests",
            "Superhosts are experienced, highly rated hosts who are committed to providing greeat starts for guests"
        ]))
        .padding()
    }
}

#Preview {
    ListingFeaturesView()
        .environment(ListingFeaturesViewModel(features: [
            "Superhosts are experienced, highly rated hosts who are committed to providing greeat starts for guests",
            "Superhosts are experienced, highly rated hosts who are committed to providing greeat starts for guests"
        ]))
}
