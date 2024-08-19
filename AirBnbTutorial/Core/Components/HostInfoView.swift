//
//  HostInfoView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/18/24.
//

import SwiftUI

struct HostInfoView: View {
    @ObservedObject var vm: HostInfoViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
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
            .frame(width: 300)
            
            Spacer()
            
            Image(vm.profilePic)
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
        }
    }
}

#Preview {
    HostInfoView(vm: HostInfoViewModel(name: "Joffrey mann", numOfGuests: 4, numOfBedrooms: 4, numOfBeds: 4, numOfBaths: 3, profilePic: "joffreyProfile"))
}
