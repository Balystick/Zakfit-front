//
//  MealPeriodView.swift
//  ZakFit_front
//
//  Created by Aurélien on 14/12/2024.
//

import SwiftUI

struct MealPeriodView: View {
    @EnvironmentObject var mealTrackingViewModel: MealTrackingViewModel

    var body: some View {
        AppSegmentedPicker(
            label: "Période",
            options: mealTrackingViewModel.monitoringPeriodOptions,
            selection: $mealTrackingViewModel.monitoringPeriod
        )
    }
}

