//
//  Untitled.swift
//  ZakFit_front
//
//  Created by Aurélien on 21/12/2024.
//

import SwiftUI

struct AppSecureFieldWithEditString: View {
    let label: String
    @Binding var value: String
    let onValueChanged: (() async -> Void)?
    
    @State private var temporaryValue: String
    @State private var isEditing: Bool = false
    
    init(label: String, value: Binding<String>, onValueChanged: (() async -> Void)? = nil) {
        self.label = label
        self._value = value
        self.onValueChanged = onValueChanged
        self._temporaryValue = State(initialValue: value.wrappedValue)
    }
    
    var body: some View {
        HStack {
            if isEditing {
                Text(label)
                    .fontWeight(.medium)
                Spacer()
                SecureField("", text: $temporaryValue, onCommit: {
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
                
            } else {
                HStack {
                    Text(label)
                        .fontWeight(.medium)
                    Spacer()
                    HStack {
                        Text(String(repeating: "•", count: value.count))
                            .foregroundColor(Color(UIColor.darkGray))
                        Image(systemName: "chevron.right")
                            .font(.caption)
                    }
                }
                .background(Color(UIColor.systemGray6))
                .onTapGesture {
                    temporaryValue = value
                    isEditing = true
                }
            }
        }
        .padding(.vertical, 6)
    }
}

