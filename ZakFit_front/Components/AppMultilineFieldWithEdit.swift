//
//  AppMultilineFieldWithEdit.swift
//  ZakFit_front
//
//  Created by Aurélien on 15/12/2024.
//

import SwiftUI

struct AppMultilineFieldWithEdit: View {
    let label: String
    @Binding var value: String
    @State private var isEditing: Bool = false
    @State private var temporaryValue: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(label)
                .fontWeight(.medium)
            
            if isEditing {
                VStack(alignment: .trailing, spacing: 5) {
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white)
                        
                        TextEditor(text: $temporaryValue)
                            .padding(5)
                    }
                    .frame(minHeight: 200)

                    Button("Valider") {
                        value = temporaryValue
                        isEditing = false
                    }
                    .foregroundColor(Color("customOrange"))
                }
            } else {
                HStack {
                    Text(value.isEmpty ? "Saisir une description" : value)
                        .foregroundColor(value.isEmpty ? .gray : Color(UIColor.darkGray))
                        .onTapGesture {
                            temporaryValue = value
                            isEditing = true
                        }
                    Spacer()
                }
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
            }
        }
        .padding(.vertical, 5)
    }
}

//AppMultilineFieldWithEdit(
//    label: "Description",
//    value: $description
//)
