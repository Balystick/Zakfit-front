//
//  FoodQuantityView.swift
//  ZakFit_front
//
//  Created by Aurélien on 15/12/2024.
//

import SwiftUI

struct FoodQuantityView: View {
    @EnvironmentObject var mealTrackingViewModel: MealTrackingViewModel

    var body: some View {
        AppFieldWithEditDouble(
          label: "Quantité consommée",
          value: $mealTrackingViewModel.foodValue,
          unit: "g"
        )
    }
}

