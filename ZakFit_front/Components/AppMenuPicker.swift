//
//  AppMenu.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct AppMenuPicker: View {
    let label: String
    let options: [String]
    @Binding var selectedOption: String
    let onValueChanged: (() async -> Void)?

    init(label: String, options: [String], selectedOption: Binding<String>, onValueChanged: (() async -> Void)? = nil) {
        self.label = label
        self.options = options
        self._selectedOption = selectedOption
        self.onValueChanged = onValueChanged
    }

    var body: some View {
        HStack {
            Text(label)
                .fontWeight(.medium)
            Spacer()
            Picker(selection: $selectedOption, label: Text(label)) {
                ForEach(options, id: \.self) { option in
                    Text(option).tag(option)
                }
            }
            .pickerStyle(.menu)
            .tint(Color("customOrange"))
            .onChange(of: selectedOption) {
                if let onValueChanged = onValueChanged {
                    Task {
                        await onValueChanged()
                    }
                }
            }
        }
    }
}
//AppMenu(
//    label: "Niveau d'activité",
//    options: ["Sédentaire", "Modéré", "Actif", "Très actif"],
//    selectedOption: $profileViewModel.user.activityLevel,
//    onValueChanged: {
//        await profileViewModel.saveUserChanges()
//    }
//)
