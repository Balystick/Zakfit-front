//
//  WeightView.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct WeightView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AppFieldWithEditDouble(
                label: "Poids actuel",
                value: $profileViewModel.lastUserWeight.weightValue,
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
                value: $profileViewModel.lastUserWeight.weightValue,
                unit: "kg",
                destination: GoalsView()
            )
        }
    }
}

