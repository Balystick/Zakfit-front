//
//  FoodDescView.swift
//  ZakFit_front
//
//  Created by Aurélien on 15/12/2024.
//

import SwiftUI

struct FoodDescView: View {
    @EnvironmentObject var mealTrackingViewModel: MealTrackingViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if mealTrackingViewModel.foodIsCustom {
                AppFieldWithEditString(
                    label: "Nom",
                    value: $mealTrackingViewModel.foodName,
                    unit: nil
                )
                Divider()
                AppMultilineFieldWithEdit(
                    label: "Description",
                    value: $mealTrackingViewModel.foodDescription
                )
            } else {
                AppField(label: "Nom", value: "Aliment", unit: nil)
                Divider()
                AppMultilineField(
                    label: "Description",
                    value: $mealTrackingViewModel.foodDescription
                )
            }
        }
    }
}

