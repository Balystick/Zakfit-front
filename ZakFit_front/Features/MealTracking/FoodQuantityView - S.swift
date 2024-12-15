//
//  FoodQuantityView.swift
//  ZakFit_front
//
//  Created by Aurélien on 15/12/2024.
//

import SwiftUI

struct FoodQuantityView: View {
    @EnvironmentObject var viewModel: MealTrackingViewModel

    var body: some View {
        AppFieldWithEdit(
          label: "Quantité consommée",
          value: $viewModel.foodValue,
          unit: "g"
        )
    }
}

