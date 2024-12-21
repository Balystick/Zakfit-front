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
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                ForEach($profileViewModel.userWeights) { $weight in
                    VStack {
                        if editingWeightID == weight.id {
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
                                Text("\(weight.weightValue, specifier: "%.2f") kg")
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                editingWeightID = weight.id
                            }
                        }
                    }
                    Divider()
                }
            }
        }
    }
}
