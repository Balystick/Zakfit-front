//
//  AppFieldWithEditDouble.swift
//  ZakFit_front
//
//  Created by Aurélien on 16/12/2024.
//

import SwiftUI

struct AppFieldWithEditDouble: View {
    let label: String
    @Binding var value: Double
    let unit: String?
    let onValueChanged: (() async -> Void)?
    
    @State private var temporaryValue: String
    @State private var isEditing: Bool = false
    
    init(label: String, value: Binding<Double>, unit: String? = nil, onValueChanged: (() async -> Void)? = nil) {
        self.label = label
        self._value = value
        self.unit = unit
        self.onValueChanged = onValueChanged
        self._temporaryValue = State(initialValue: "\(value.wrappedValue)")
    }
    
    var body: some View {
        HStack {
            if isEditing {
                TextField("Entrez une valeur", text: $temporaryValue, onCommit: {
                    if let newValue = Double(temporaryValue) {
                        value = newValue
                        if let onValueChanged = onValueChanged {
                            Task {
                                await onValueChanged()
                            }
                        }
                    }
                    isEditing = false
                })
                .padding(12)
                .background(Color.white)
                .cornerRadius(8)
            } else {
                Text(label)
                    .fontWeight(.medium)
                Spacer()
                HStack {
                    Text(String(format: "%.2f", locale: Locale(identifier: "en_US"), value))                        .onTapGesture {
                        temporaryValue = String(format: "%.2f", value)
                        isEditing = true
                    }
                    if let unit = unit {
                        Text(unit)
                    }
                }
            }
        }
        .padding(.vertical, 5)
    }
}

//AppFieldWithEditDouble(
//    label: "Taille",
//    value: $profileViewModel.user.height,
//    unit: "m",
//    onValueChanged: {
//        await profileViewModel.saveUserChanges()
//    }
//)