//
//  DestinationSearchView.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 9/17/24.
//

import SwiftUI
import Combine

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    @Environment(DestinationSearchOptionViewModel.self) var searchOptionVM
    var expandedHeight: CGFloat {
        switch searchOptionVM.selectedOption {
        case .location:
            return 120
        case .dates:
            return 180
        case .guests:
            return 120
        }
    }
    
    var collapsedHeight: CGFloat {
        return 64
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation(.snappy) {
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                if !destination.isEmpty {
                    Button("Clear") {
                        destination = ""
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            VStack(alignment: .leading) {
                if searchOptionVM.selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        TextField("Search destination", text: $destination)
                            .font(.subheadline)
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedPickerView()
                        .environment(CollapsedPickerViewModel(title: "Where", description: "Add destination"))
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: searchOptionVM.selectedOption == .location ? expandedHeight : collapsedHeight)
            .onTapGesture {
                withAnimation(.snappy) {
                    searchOptionVM.selectedOption = .location
                }
            }
            
            // date selection view
            VStack {
                if searchOptionVM.selectedOption == .dates {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading) {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                            .onTapGesture(count: 99) {}
                        
                        Divider()
                        
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                            .onTapGesture(count: 99) {}
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                } else {
                    CollapsedPickerView()
                        .environment(CollapsedPickerViewModel(title: "When", description: "Add dates"))
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: searchOptionVM.selectedOption == .dates ? expandedHeight : collapsedHeight)
            .if(searchOptionVM.selectedOption != .dates) { v in
                v.onTapGesture {
                    withAnimation(.snappy) {
                        searchOptionVM.selectedOption = .dates
                    }
                }
            }
            
            // num guests view
            VStack(alignment: .leading) {
                // date selection view
                if searchOptionVM.selectedOption == .guests {
                    Text("Who's coming")
                        .font(.title)
                        .fontWeight(.semibold)
                    Stepper {
                        Text("\(numGuests) Adults")
                    } onIncrement: {
                        numGuests += 1
                    } onDecrement: {
                        guard numGuests > 0 else { return }
                        numGuests -= 1
                    }
                } else {
                    // num guests view
                    CollapsedPickerView()
                        .environment(CollapsedPickerViewModel(title: "Who", description: "Add guests"))
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: searchOptionVM.selectedOption == .guests ? expandedHeight : collapsedHeight)
            .if(searchOptionVM.selectedOption != .guests) { v in
                v.onTapGesture {
                    withAnimation(.snappy) {
                        searchOptionVM.selectedOption = .guests
                        
                    }
                }
            }
        }
        
        Spacer()
    }
}

#Preview {
    DestinationSearchView(show: .constant(true))
        .environment(DestinationSearchOptionViewModel())
}
