//
//  EnergyConsumptionView.swift
//  ZakFit_front
//
//  Created by Aurélien on 12/12/2024.
//

import SwiftUI

struct EnergyConsumptionView: View {
    @EnvironmentObject var viewModel: ProfileViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Objectif de calories consommées")
                    .fontWeight(.medium)
                Spacer()
                Text("2000 kcal")
                    .foregroundColor(.gray)
            }
            Divider()
            HStack {
                Text("Poids actuel")
                    .fontWeight(.medium)
                Spacer()
                Text("75 kg")
                    .foregroundColor(.gray)
            }
            HStack {
                Text("Poids cible")
                    .fontWeight(.medium)
                Spacer()
                Text("70 kg (-5 kg)")
                    .foregroundColor(.gray)
            }
        }
    }
}
