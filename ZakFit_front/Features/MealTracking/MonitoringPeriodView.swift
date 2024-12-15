//
//  MonitoringPeriodView.swift
//  ZakFit_front
//
//  Created by Aurélien on 14/12/2024.
//

import SwiftUI

struct MonitoringPeriodView: View {
    @EnvironmentObject var viewModel: MealTrackingViewModel

    var body: some View {
        AppPicker(
            label: "Période",
            options: viewModel.monitoringPeriodOptions,
            selection: $viewModel.monitoringPeriod
        )
    }
}

