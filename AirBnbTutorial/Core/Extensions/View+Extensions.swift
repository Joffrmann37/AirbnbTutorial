//
//  View+Extensions.swift
//  AirBnbTutorial
//
//  Created by Joffrey Mann on 9/18/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
