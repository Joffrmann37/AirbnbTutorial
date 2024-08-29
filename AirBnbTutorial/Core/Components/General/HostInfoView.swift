//
//  HostInfoView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 8/18/24.
//

import SwiftUI

struct HostInfoVMKey: EnvironmentKey {
    static var defaultValue = HostInfoViewModel(name: "Joffrey mann", numOfGuests: 4, numOfBedrooms: 4, numOfBeds: 4, numOfBaths: 3, profilePic: "joffreyProfile")
}

private extension EnvironmentValues {
    var vm: HostInfoViewModel {
        get { self[HostInfoVMKey.self] }
        set { self[HostInfoVMKey.self] = newValue }
    }
}

struct HostInfoView: View {
    @Environment(\.vm) var vm
    
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
            
            Image(vm.profilePic)
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
        }
        .environment(HostInfoViewModel(name: "Joffrey Mann", numOfGuests: 4, numOfBedrooms: 4, numOfBeds: 4, numOfBaths: 3, profilePic: "joffreyProfile"))
        .padding()
    }
}

#Preview {
    HostInfoView()
        .environment(HostInfoViewModel(name: "Joffrey mann", numOfGuests: 4, numOfBedrooms: 4, numOfBeds: 4, numOfBaths: 3, profilePic: "joffreyProfile"))
}
