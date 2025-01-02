//
//  FoodEnergyView.swift
//  ZakFit_front
//
//  Created by Aurélien on 15/12/2024.
//

import SwiftUI

struct FoodEnergyView: View {
    @EnvironmentObject var mealTrackingViewModel: MealTrackingViewModel

    var body: some View {
        if mealTrackingViewModel.foodIsCustom {
            AppFieldWithEditDouble(
              label: "Énergie",
              value: $mealTrackingViewModel.foodValue,
              unit: "kcal"
            )
        } else {
            AppField(label: "Énergie", value: 100, unit: "kcal")
        }
    }
}

