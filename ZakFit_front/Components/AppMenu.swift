//
//  AppMenu.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct AppMenu: View {
    let label: String
    let options: [String]
    @Binding var selectedOption: String

    var body: some View {
        HStack {
            Text(label)
                .fontWeight(.medium)
            Spacer()
            Menu {
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        selectedOption = option
                    }) {
                        Text(option)
                    }
                }
            } label: {
                HStack {
                    Text(selectedOption)
                        .foregroundColor(.gray)
                    Image(systemName: "chevron.up.chevron.down")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.vertical, 5)
    }
}
