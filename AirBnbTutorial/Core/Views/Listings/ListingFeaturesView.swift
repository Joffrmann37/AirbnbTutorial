//
//  ListingFeaturesView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/25/24.
//

import SwiftUI

private extension EnvironmentValues {
    var vm: ExploreViewModel {
        get { self[ExploreVMKey.self] }
        set { self[ExploreVMKey.self] = newValue }
    }
}

//  listing features
struct ListingFeaturesView: View {
    @Binding var features: [Feature]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(features, id: \.self) { feature in
                HStack(spacing: 12) {
                    Image(systemName: feature.image)
                    
                    VStack(alignment: .leading) {
                        Text(feature.type)
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Text(feature.detail)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                }
            }
        }
        .environment(ExploreViewModel(useCase: FetchListingsUseCase(repository: ListingsRepository()), url: URL(string: "http://127.0.0.1:5000/listings")!))
        .padding()
    }
}

#Preview {
    ListingFeaturesView(features: .constant([Feature(type: "Superhost", detail: "Superhosts are experienced, highly rated hosts who are committed to providing greeat starts for guests.", image: "medal")]))
}
