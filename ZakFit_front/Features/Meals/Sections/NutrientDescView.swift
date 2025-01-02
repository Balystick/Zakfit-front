//
//  MicronutrientDescView.swift
//  ZakFit_front
//
//  Created by Aurélien on 15/12/2024.
//

import SwiftUI

struct NutrientDescView: View {
    @EnvironmentObject var mealTrackingViewModel: MealTrackingViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if mealTrackingViewModel.nutrientIsCustom {
                AppFieldWithEditString(
                    label: "Nom",
                    value: $mealTrackingViewModel.nutrientName,
                    unit: nil
                )
                Divider()
                AppMultilineFieldWithEdit(
                    label: "Description",
                    value: $mealTrackingViewModel.nutrientDescription
                )
                Divider()
                AppFieldWithEditDouble(
                    label: "Teneur pour 100 g d'aliment",
                    value: $mealTrackingViewModel.nutrientValue,
                    unit: "mg"
                )
            } else {
                AppField(label: "Nom", value: "Vitamine C", unit: nil)
                Divider()
                AppMultilineField(
                    label: "Description",
                    value: $mealTrackingViewModel.nutrientDescription
                )
                Divider()
                AppField(label: "Teneur pour 100 g d'aliment", value: 73, unit: "mg")
            }
        }
    }
}

