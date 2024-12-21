//
//  AppDatePicker.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct AppDatePicker: View {
    let label: String
    @Binding var dateString: String
    let components: DatePickerComponents
    let onValueChanged: (() async -> Void)?

    @State private var localDate: Date

    init(label: String, dateString: Binding<String>, components: DatePickerComponents, onValueChanged: (() async -> Void)? = nil) {
        self.label = label
        self._dateString = dateString
        self.components = components
        self.onValueChanged = onValueChanged

        if let initialDate = ISO8601DateFormatter().date(from: dateString.wrappedValue) {
            self._localDate = State(initialValue: initialDate)
        } else {
            self._localDate = State(initialValue: Date())
        }
    }

    var body: some View {
        HStack {
            Text(label)
                .fontWeight(.medium)
            Spacer()
            DatePicker(
                "",
                selection: $localDate,
                displayedComponents: components
            )
            .labelsHidden()
            .onChange(of: localDate) {
                updateBindingFromLocalDate()
            }
        }
        .padding(.vertical, 5)
        .onAppear {
            syncBindingToLocalDate()
        }
    }

    private func syncBindingToLocalDate() {
        if let convertedDate = ISO8601DateFormatter().date(from: dateString) {
            localDate = convertedDate
        } else {
            dateString = ISO8601DateFormatter().string(from: localDate)
        }
    }

    private func updateBindingFromLocalDate() {
        dateString = ISO8601DateFormatter().string(from: localDate)
        if let onValueChanged = onValueChanged {
            Task {
                await onValueChanged()
            }
        }
    }
}


