//
//  EnergyExpenditureView.swift
//  ZakFit_front
//
//  Created by Aurélien on 12/12/2024.
//

import SwiftUI

struct EnergyExpenditureView: View {
    @EnvironmentObject var viewModel: ProfileViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Objectif de dépense calorique")
                    .fontWeight(.medium)
                Spacer()
                Text("500 kcal")
                    .foregroundColor(.gray)
            }
            Divider()
            Button(action: {
            }) {
                Text("Ajouter un objectif général")
                    .foregroundColor(.orange)
            }
            Divider()
            Button(action: {
            }) {
                Text("Ajouter un objectif spécifique")
                    .foregroundColor(.orange)
            }
        }
    }
}
