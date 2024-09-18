//
//  CollapsedPickerView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 9/18/24.
//

import SwiftUI

struct CollapsedPickerView: View {
    @Environment(CollapsedPickerViewModel.self) var vm
    
    var body: some View {
        VStack {
            HStack {
                Text(vm.title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(vm.description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
        //        .padding()
        //        .background(.white)
        //        .clipShape(RoundedRectangle(cornerRadius: 12))
        //        .padding()
        //        .shadow(radius: 10)
    }
}
