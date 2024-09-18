//
//  ProfileOptionRowView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 9/18/24.
//

import SwiftUI

struct ProfileOptionRowView: View {
    var item: ProfileItem
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: item.icon)
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding(.trailing, 10)
                
                Text(item.name)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .padding(.trailing, 20)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        Divider()
            .padding(.trailing, 20)
    }
}

#Preview {
    ProfileOptionRowView(item: ProfileItem(name: "Name", icon: "magnifyingglass"))
}
