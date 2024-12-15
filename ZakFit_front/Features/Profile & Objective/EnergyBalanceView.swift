//
//  EnergyBalanceView.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct EnergyBalanceView: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AppFieldWithPush(
                label: "Objectif de consommation",
                value: "70",
                unit: "kcal",
                destination: { label in
                WeightEditView(source: label) })
            Divider()
            AppFieldWithPush(
                label: "Objectif de dépense",
                value: "2500",
                unit: "kcal",
                destination: { label in
                WeightEditView(source: label) })
        }
    }
}

