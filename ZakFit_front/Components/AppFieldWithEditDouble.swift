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
    let startEditing: Bool?
    
    init(label: String, value: Binding<Double>, unit: String? = nil, startEditing: Bool? = nil, onValueChanged: (() async -> Void)? = nil) {
        self.label = label
        self._value = value
        self.unit = unit
        self.startEditing = startEditing
        self.onValueChanged = onValueChanged
        self._temporaryValue = State(initialValue: "\(value.wrappedValue)")
    }
    
    var body: some View {
        HStack {
            if isEditing {
                if value != 0 {
                    Button(action: {
                        value = 0
                        temporaryValue = "0"
                        isEditing = false
                        if let onValueChanged = onValueChanged {
                            Task {
                                await onValueChanged()
                            }
                        }
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                }
                Text(label)
                    .fontWeight(.medium)
                Spacer()
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
                .padding(8)
                .background(Color.white)
                .cornerRadius(8)
                if let unit = unit {
                    Text(unit)
                }
            } else {
                Text(label)
                    .fontWeight(.medium)
                Spacer()
                HStack {
                    if value == 0 {
                        Text("Non défini")
                            .foregroundColor(.gray)
                    } else {
                        Text(String(format: "%.2f", locale: Locale(identifier: "en_US"), value))
                        if let unit = unit {
                            Text(unit)
                        }
                    }
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .onTapGesture {
          temporaryValue = String(format: "%.2f", value)
          isEditing = true
      }
            }
        }
        .padding(.vertical, 4)
        .onAppear {
            if startEditing == true {
                isEditing = true
            }
        }
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
