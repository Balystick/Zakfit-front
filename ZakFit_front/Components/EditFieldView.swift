//
//  EditFieldView.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct EditFieldView: View {
    let label: String
    @Binding var value: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Form {
            TextField(label, text: $value)
                .textFieldStyle(PlainTextFieldStyle())
                .autocapitalization(.none)
                .disableAutocorrection(true)
        }
        .navigationTitle(label)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("OK") {
                    dismiss()
                }
            }
        }
    }
}
