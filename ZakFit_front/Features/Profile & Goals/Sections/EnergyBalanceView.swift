//
//  EnergyBalanceView.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct EnergyBalanceView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AppFieldWithPush(
                label: "Objectif de consommation",
                value: $profileViewModel.tmp,
                unit: "kcal",
                destination: ActivityGoalsView()
            )
            Divider()
            AppFieldWithPush(
                label: "Objectif de dépense",
                value: $profileViewModel.tmp,
                unit: "kcal",
                destination: ActivityGoalsView()
            )
        }
    }
}

