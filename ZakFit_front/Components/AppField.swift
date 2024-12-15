//
//  InfoField.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct AppField<T: LosslessStringConvertible>: View {
    let label: String
    let value: T
    let unit: String?

    var body: some View {
        HStack {
            Text(label)
                .fontWeight(.medium)
            Spacer()
            HStack(spacing: 5) {
                Text("\(value)")
                if let unit = unit {
                    Text(unit)
                        .font(.footnote)
                }
            }
        }
        .padding(.vertical, 5)
    }
}
