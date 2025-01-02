//
//  WeightListView.swift
//  ZakFit_front
//
//  Created by Aurélien on 16/12/2024.
//

import SwiftUI

struct WeightListView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @State private var editingWeightID: UUID? = nil

    var body: some View {
        VStack {
            if profileViewModel.userWeights.isEmpty {
                Text("Aucune donnée disponible")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(maxWidth: .infinity)
            } else {
                ForEach($profileViewModel.userWeights, id: \.id) { $weight in
                    HStack {
                        if editingWeightID == weight.id {
                            Button(action: {
                                Task {
                                    await profileViewModel.deleteUserWeight(id: weight.id)
                                    editingWeightID = nil
                                }
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }

                            AppFieldWithEditDouble(
                                label: profileViewModel.formatDate(weight.dateTime),
                                value: $weight.weightValue,
                                unit: "kg",
                                startEditing: true,
                                onValueChanged: {
                                    await profileViewModel.updateUserWeight(
                                        id: weight.id,
                                        dateTime: ISO8601DateFormatter().date(from: weight.dateTime) ?? Date(),
                                        weightValue: weight.weightValue
                                    )
                                    editingWeightID = nil
                                }
                            )
                        } else {
                            HStack {
                                Text(profileViewModel.formatDate(weight.dateTime))
                                    .fontWeight(.medium)
                                Spacer()
                                Text("\(String(format: "%.2f", locale: Locale(identifier: "en_US"), weight.weightValue)) kg")
                                Image(systemName: "chevron.right")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .padding(.vertical, 10)
                            }
                            .onTapGesture {
                                editingWeightID = weight.id
                            }
                        }
                    }

                    if weight.id != profileViewModel.userWeights.last?.id {
                        Divider()
                    }
                }
            }
        }
    }
}

