//
//  WeightTrackingView.swift
//  ZakFit_front
//
//  Created by Aurélien on 02/01/2025.
//

import SwiftUI

struct WeightTrackingView: View {
    @EnvironmentObject var dashboardViewModel: DashboardViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AppField(
                label: "Poids actuel",
                value: dashboardViewModel.lastUserWeight.weightValue,
                unit: "kg"
            )
            WeightChartView()
        }
    }
}
