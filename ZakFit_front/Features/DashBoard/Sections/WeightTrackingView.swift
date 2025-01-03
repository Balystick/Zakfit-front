//
//  WeightTrackingView.swift
//  ZakFit_front
//
//  Created by Aurélien on 02/01/2025.
//

import SwiftUI

struct WeightTrackingView: View {
    @EnvironmentObject var sharedViewModel: SharedViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AppField(
                label: "Poids actuel",
                value: sharedViewModel.lastUserWeight.weightValue,
                unit: "kg"
            )
            WeightChartView()
        }
    }
}
