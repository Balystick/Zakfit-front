//
//  AppSegmentedPicker.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct AppSegmentedPicker: View {
    let label: String
    let options: [String]
    @Binding var selection: String
    let onValueChanged: (() async -> Void)?

    init(label: String, options: [String], selection: Binding<String>, onValueChanged: (() async -> Void)? = nil) {
        self.label = label
        self.options = options
        self._selection = selection
        self.onValueChanged = onValueChanged
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(label)
                .fontWeight(.medium)
            Picker(label, selection: $selection) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                        .tag(option)
                }
            }
            .pickerStyle(.segmented)
            .onChange(of: selection) {
                if let onValueChanged = onValueChanged {
                    Task {
                        await onValueChanged()
                    }
                }
            }
        }
        .padding(.vertical, 5)
    }
}
//AppSegmentedPicker(
//    label: "Période",
//    options: ["Jour", "Semaine", "Mois"],
//    selection: $profileViewModel.weightPeriod,
//    onValueChanged: {
//        await profileViewModel.fetchUserWeightsByPeriod()
//    }
//)
