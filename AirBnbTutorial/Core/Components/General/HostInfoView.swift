//
//  HostInfoView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/18/24.
//

import SwiftUI

struct HostInfoView: View {
    @Environment(HostInfoViewModel.self) var vm
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Entire villa hosted by \(vm.name)")
                    .font(.headline)
                    .frame(width: 250, alignment: .leading)
                
                HStack(spacing: 2) {
                    Text("\(vm.numOfGuests) guests -")
                    Text("\(vm.numOfBedrooms) bedrooms -")
                    Text("\(vm.numOfBeds) beds -")
                    Text("\(vm.numOfBaths) baths")
                }
                .font(.caption)
            }
            .frame(width: 300, alignment: .leading)
            
            Spacer()
            
            AsyncImage(url: URL(string: vm.profilePic)!) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
        }
        .padding()
    }
}

#Preview {
    HostInfoView()
        .environment(HostInfoViewModel(name: "Joffrey mann", numOfGuests: 4, numOfBedrooms: 4, numOfBeds: 4, numOfBaths: 3, profilePic: "joffreyProfile"))
}
