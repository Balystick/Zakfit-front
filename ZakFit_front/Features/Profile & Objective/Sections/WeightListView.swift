//
//  WeightListView.swift
//  ZakFit_front
//
//  Created by Aurélien on 16/12/2024.
//

import SwiftUI

struct WeightListView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(profileViewModel.userWeights.sorted(by: { $0.dateTime > $1.dateTime }), id: \.id) { weight in
                    HStack {
                        Text(profileViewModel.formatDate(weight.dateTime))
                            .fontWeight(.medium)
                        Text("\(weight.weightValue, specifier: "%.2f") kg")
                        Spacer()
                        Button(action: {
                            print("Modifier l'enregistrement \(weight.id)")
                        }) {
                            Image(systemName: "pencil")
                                .foregroundColor(.blue)
                        }
                        Button(action: {
                            print("Supprimer l'enregistrement \(weight.id)")
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                    Divider()
                }
            }
        }
    }
}
