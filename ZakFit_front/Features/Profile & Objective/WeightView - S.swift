//
//  WeightView.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct WeightView: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AppFieldWithPush(
                label: "Poids actuel",
                value: "70",
                unit: "kg",
                destination: { label in
                    WeightEditView(source: label) }
            )
            Divider()
            AppFieldWithPush(
                label: "Poids cible",
                value: "1,80",
                unit: "kg",
                destination: { label in
                    WeightEditView(source: label) }
            )
        }
    }
}

