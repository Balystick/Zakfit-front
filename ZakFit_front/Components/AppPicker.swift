//
//  AppPicker.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct AppPicker<T: Hashable>: View {
    let label: String
    let options: [T]
    @Binding var selection: T

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(label)
                .fontWeight(.medium)
            Picker(label, selection: $selection) {
                ForEach(options, id: \.self) { option in
                    Text("\(option)")
                        .tag(option)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .padding(.vertical, 5)
    }
}
