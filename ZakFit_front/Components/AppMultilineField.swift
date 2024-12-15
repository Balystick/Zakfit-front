//
//  AppMultilineField.swift
//  ZakFit_front
//
//  Created by Aurélien on 15/12/2024.
//

import SwiftUI

struct AppMultilineField: View {
    let label: String
    @Binding var value: String
    
    var body: some View {
        if !value.isEmpty {
            VStack(alignment: .leading, spacing: 5) {
                Text(label)
                    .fontWeight(.medium)
                
                HStack {
                    Text(value)
                        .foregroundColor(Color(UIColor.darkGray))
                    Spacer()
                }
                .background(Color(UIColor.systemGray6))
            }
            .padding(.vertical, 5)
        }
    }
}

//AppMultilineField(
//    label: "Description",
//    value: $description
//)
