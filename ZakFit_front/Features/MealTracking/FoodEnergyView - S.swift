//
//  FoodEnergyView.swift
//  ZakFit_front
//
//  Created by Aurélien on 15/12/2024.
//

import SwiftUI

struct FoodEnergyView: View {
    @EnvironmentObject var viewModel: MealTrackingViewModel

    var body: some View {
        if viewModel.foodIsCustom {
            AppFieldWithEdit(
              label: "Énergie",
              value: $viewModel.foodValue,
              unit: "kcal"
            )
        } else {
            AppField(label: "Énergie", value: 100, unit: "kcal")
        }
    }
}

