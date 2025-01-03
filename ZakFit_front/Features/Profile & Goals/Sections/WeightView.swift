//
//  WeightView.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct WeightView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @EnvironmentObject var sharedViewModel: SharedViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AppFieldWithEditDouble(
                label: "Poids actuel",
                value: $sharedViewModel.lastUserWeight.weightValue,
                unit: "kg",
                onValueChanged: {
                    await profileViewModel.createUserWeight()
                }
            )
            Divider()
            AppFieldWithLink(
                label: "Toutes les données",
                value: "Consulter",
                destination: {
                    WeightDataView()
                }
            )
            Divider()
            AppFieldWithPush(
                label: "Poids cible",
                value: $sharedViewModel.lastUserWeight.weightValue,
                unit: "kg",
                destination: GoalsView()
            )
        }
    }
}

