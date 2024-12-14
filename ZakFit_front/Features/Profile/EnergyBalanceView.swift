//
//  EnergyBalanceView.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct EnergyBalanceView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AppFieldWithPush(
                label: "Objectif de consommation",
                value: $viewModel.weight,
                unit: "kcal",
                destination: { label in
                WeightEditView(source: label) })
            Divider()
            AppFieldWithPush(
                label: "Objectif de dépense",
                value: $viewModel.weight,
                unit: "kcal",
                destination: { label in
                WeightEditView(source: label) })
        }
    }
}

#Preview {
    EnergyBalanceView()
}
