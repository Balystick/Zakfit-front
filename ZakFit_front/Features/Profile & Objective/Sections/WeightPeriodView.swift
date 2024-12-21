//
//  WeightPeriodView.swift
//  ZakFit_front
//
//  Created by Aurélien on 16/12/2024.
//

import SwiftUI

struct WeightPeriodView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AppSegmentedPicker(
                label: "Période",
                options: profileViewModel.weightPeriodOptions,
                selection: $profileViewModel.weightPeriod,
                onValueChanged: {
                    await profileViewModel.fetchUserWeightsByPeriod()
                }
            )
        }
    }
}

