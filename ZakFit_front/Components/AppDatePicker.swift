//
//  AppDatePicker.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct AppDatePicker: View {
    let label: String
    @Binding var date: Date?

    var body: some View {
        HStack {
            Text(label)
                .fontWeight(.medium)
            Spacer()
            DatePicker(
                "",
                selection: Binding(
                    get: { date ?? Date() },
                    set: { date = $0 }
                ),
                displayedComponents: .date
            )
            .labelsHidden()
            .tint(.orange)
        }
        .padding(.vertical, 5)
    }
}

// AppDatePicker(label: "", date: $viewModel.)

