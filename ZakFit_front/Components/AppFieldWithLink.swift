//
//  AppFieldWithLink.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct AppFieldWithLink<Destination: View>: View {
    let label: String
    let value: String
    let destination: () -> Destination

    var body: some View {
        HStack {
                Text(label)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                Spacer()
            NavigationLink(destination: destination()) {
                Text(value)
                    .foregroundColor(.orange)
                }
        }
        .padding(.vertical, 5)
    }
}

// AppFieldWithLink(label: "", value: "", destination: { View() })
