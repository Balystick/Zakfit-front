//
//  FoodDescView.swift
//  ZakFit_front
//
//  Created by Aurélien on 15/12/2024.
//

import SwiftUI

struct FoodDescView: View {
    @EnvironmentObject var viewModel: MealTrackingViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if viewModel.foodIsCustom {
                AppFieldWithEdit(
                    label: "Nom",
                    value: $viewModel.foodName,
                    unit: nil
                )
                Divider()
                AppMultilineFieldWithEdit(
                    label: "Description",
                    value: $viewModel.foodDescription
                )
            } else {
                AppField(label: "Nom", value: "Aliment", unit: nil)
                Divider()
                AppMultilineField(
                    label: "Description",
                    value: $viewModel.foodDescription
                )
            }
        }
    }
}

