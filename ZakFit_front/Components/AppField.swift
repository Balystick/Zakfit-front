//
//  InfoField.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct AppField: View {
    let label: String
    @Binding var value: String

    var body: some View {
        NavigationLink(destination: EditFieldView(label: label, value: $value)) {
            HStack {
                Text(label)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                Spacer()
                Text(value)
                    .foregroundColor(.gray)
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 5)
    }
}
