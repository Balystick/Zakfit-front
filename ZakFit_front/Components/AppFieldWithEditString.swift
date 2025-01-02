//
//  AppDoubleFieldWithEdit.swift
//  ZakFit_front
//
//  Created by Aurélien on 19/12/2024.
//

import SwiftUI

struct AppFieldWithEditString: View {
    let label: String
    @Binding var value: String
    let unit: String?
    let onValueChanged: (() async -> Void)?

    @State private var temporaryValue: String
    @State private var isEditing: Bool = false

    init(label: String, value: Binding<String>, unit: String? = nil, onValueChanged: (() async -> Void)? = nil) {
        self.label = label
        self._value = value
        self.unit = unit
        self.onValueChanged = onValueChanged
        self._temporaryValue = State(initialValue: value.wrappedValue)
    }

    var body: some View {
        HStack {
            if isEditing {
                TextField("", text: $temporaryValue, onCommit: {
                    value = temporaryValue
                    if let onValueChanged = onValueChanged {
                        Task {
                            await onValueChanged()
                        }
                    }
                    isEditing = false
                })
                .padding(8)
                .background(Color.white)
                .cornerRadius(10)

                if let unit = unit {
                    Text(unit)
                }
            } else {
                Text(label)
                    .fontWeight(.medium)
                Spacer()
                HStack {
                    Text(value)
                        .foregroundColor(Color(UIColor.darkGray))
                        .onTapGesture {
                            temporaryValue = value
                            isEditing = true
                        }
                    if let unit = unit {
                        Text(unit)
                    }
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.vertical, 6)
    }
}
//AppFieldWithEditString(
//    label: "Prénom",
//    value: $profileViewModel.user.firstName,
//    unit: "",
//    onValueChanged: {
//        await profileViewModel.saveUserChanges()
//    }
//)
