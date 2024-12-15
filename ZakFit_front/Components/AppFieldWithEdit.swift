//
//  AppFieldWithEdit.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct AppFieldWithEdit<T: LosslessStringConvertible>: View {
    let label: String
    @Binding var value: T
    let unit: String?
    @State private var temporaryValue: String = ""
    @State private var isEditing: Bool = false
    
    var body: some View {
        HStack {
            if isEditing {
                TextField("", text: $temporaryValue, onCommit: {
                    if let newValue = T(temporaryValue) {
                        value = newValue
                    }
                    isEditing = false
                })
                .padding(12)
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
                    Text("\(value)")
                        .onTapGesture {
                            temporaryValue = "\(value)"
                            isEditing = true
                        }
                    if let unit = unit {
                        Text(unit)
                    }
                    Image(systemName: "chevron.right")
                        .font(.caption)
                }
            }
        }
        .padding(.vertical, 5)
    }
}

//  AppFieldWithEdit(
//    label: "",
//    value: $viewModel.,
//    unit: "kg")

