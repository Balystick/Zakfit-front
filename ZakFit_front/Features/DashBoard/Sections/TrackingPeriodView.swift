//
//  TrackingPeriodView.swift
//  ZakFit_front
//
//  Created by Aurélien on 16/12/2024.
//

import SwiftUI

struct TrackingPeriodView: View {
    @EnvironmentObject var dashboardViewModel: DashboardViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AppSegmentedPicker(
                label: nil,
                options: dashboardViewModel.trackingPeriodOptions,
                selection: $dashboardViewModel.trackingPeriod,
                onValueChanged: {
                    await dashboardViewModel.fetchUserWeightsByPeriod()
                }
            )
        }
    }
}

