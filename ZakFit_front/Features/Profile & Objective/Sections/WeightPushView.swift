//
//  WeightView.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct WeightPushView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AppFieldWithPush(
                label: "Poids actuel",
                value: $profileViewModel.lastUserWeight.weightValue,
                unit: "kg",
                destination: WeightDescView()
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

