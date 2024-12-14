//
//  WeightView.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct WeightView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AppFieldWithPush(
                label: "Poids actuel",
                value: $viewModel.weight,
                unit: "kg",
                destination: { label in
                    WeightEditView(source: label) }
            )
            Divider()
            AppFieldWithPush(
                label: "Poids cible",
                value: $viewModel.weight,
                unit: "kg",
                destination: { label in
                    WeightEditView(source: label) }
            )
        }
    }
}

#Preview {
    WeightView()
}
