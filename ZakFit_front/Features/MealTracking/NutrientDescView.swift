//
//  MicronutrientDescView.swift
//  ZakFit_front
//
//  Created by Aurélien on 15/12/2024.
//

import SwiftUI

struct NutrientDescView: View {
    @EnvironmentObject var viewModel: MealTrackingViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if viewModel.nutrientIsCustom {
                AppFieldWithEdit(
                    label: "Nom",
                    value: $viewModel.nutrientName,
                    unit: nil
                )
                Divider()
                AppMultilineFieldWithEdit(
                    label: "Description",
                    value: $viewModel.nutrientDescription
                )
                Divider()
                AppFieldWithEdit(
                    label: "Teneur pour 100 g d'aliment",
                    value: $viewModel.nutrientValue,
                    unit: "mg"
                )
            } else {
                AppField(label: "Nom", value: "Vitamine C", unit: nil)
                Divider()
                AppMultilineField(
                    label: "Description",
                    value: $viewModel.nutrientDescription
                )
                Divider()
                AppField(label: "Teneur pour 100 g d'aliment", value: 73, unit: "mg")
            }
        }
    }
}

