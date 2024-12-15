//
//  AppSlider.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct AppSlider: View {
    let label: String
    @Binding var value: Double
    let range: ClosedRange<Double> // Intervalle du slider
    let exponent: Double           // Détermine la "force" exponentielle
    let unit: String?              // Facultatif : unité à afficher

    var body: some View {
        VStack(alignment: .leading) {
            // Label
            HStack {
                Text(label)
                    .fontWeight(.medium)
                Spacer()
                Text("\(value, specifier: "%.2f") \(unit ?? "")")
                    .foregroundColor(.gray)
            }

            // Slider
            Slider(
                value: Binding(
                    get: {
                        mapToExponential(value, range: range, exponent: exponent)
                    },
                    set: { newValue in
                        value = mapFromExponential(newValue, range: range, exponent: exponent)
                    }
                ),
                in: 0...1 // Le slider est toujours sur une échelle de 0 à 1 pour l'exponentielle
            )
            .tint(Color("customOrange")) // Couleur du slider
        }
        .padding(.vertical, 5)
    }

    // Map la valeur réelle (dans la plage) vers une échelle exponentielle (0 à 1)
    private func mapToExponential(_ value: Double, range: ClosedRange<Double>, exponent: Double) -> Double {
        let normalizedValue = (value - range.lowerBound) / (range.upperBound - range.lowerBound)
        return pow(normalizedValue, 1 / exponent)
    }

    // Map une valeur exponentielle (0 à 1) vers la plage réelle
    private func mapFromExponential(_ expValue: Double, range: ClosedRange<Double>, exponent: Double) -> Double {
        let linearValue = pow(expValue, exponent)
        return range.lowerBound + linearValue * (range.upperBound - range.lowerBound)
    }
}
