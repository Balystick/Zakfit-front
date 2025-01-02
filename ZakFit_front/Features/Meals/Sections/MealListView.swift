//
//  ActivityView.swift
//  ZakFit_front
//
//  Created by Aurélien on 14/12/2024.
//

import SwiftUI

struct MealListView: View {
    @EnvironmentObject var mealTrackingViewModel: MealTrackingViewModel
    @State private var editingWeightID: UUID? = nil
    @State private var swipedWeightID: UUID? = nil
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text("Coucou")
                // MealAddView()
//                ForEach($mealTrackingViewModel.userWeights, id: \.id) { $weight in
//                    ZStack {
//                        HStack {
//                            Spacer()
//                            Button() {
//                                Task {
//                                    await mealTrackingViewModel.deleteUserWeight(id: weight.id)
//                                    swipedWeightID = nil
//                                }
//                            } label: {
//                                Spacer()
//                                Text("Supprimer")
//                                    .foregroundColor(Color.white)
//                                    .padding(.vertical, 12)
//                                    .padding(.trailing, 10)
//                            }
//                            .cornerRadius(10)
//                            
//                        }
//                        .background(.red)
//                        
//                        HStack {
//                            if editingWeightID == weight.id {
//                                AppFieldWithEditDouble(
//                                    label: mealTrackingViewModel.formatDate(weight.dateTime),
//                                    value: $weight.weightValue,
//                                    unit: "kg",
//                                    startEditing: true,
//                                    onValueChanged: {
//                                        await mealTrackingViewModel.updateUserWeight(
//                                            id: weight.id,
//                                            dateTime: ISO8601DateFormatter().date(from: weight.dateTime) ?? Date(),
//                                            weightValue: weight.weightValue
//                                        )
//                                        editingWeightID = nil
//                                    }
//                                )
//                                .padding(.vertical, 10)
//                            }
//                            else {
//                                HStack {
//                                    Text(mealTrackingViewModel.formatDate(weight.dateTime))
//                                        .fontWeight(.medium)
//                                    Spacer()
//                                    Text("\(String(format: "%.2f", locale: Locale(identifier: "en_US"), weight.weightValue)) kg")
//                                        .padding(.vertical, 12)
//                                }
//                                .onTapGesture {
//                                    editingWeightID = weight.id
//                                }
//                            }
//                        }
//                        .background(Color(UIColor.systemGray6))
//                        .offset(x: swipedWeightID == weight.id ? -100 : 0)
//                        .animation(.spring(), value: swipedWeightID)
//                        .gesture(
//                            DragGesture()
//                                .onChanged { value in
//                                    if value.translation.width < -50 {
//                                        swipedWeightID = weight.id
//                                    }
//                                }
//                                .onEnded { value in
//                                    if value.translation.width > -50 {
//                                        swipedWeightID = nil
//                                    }
//                                }
//                        )
//                    }
//                    if weight.id != mealTrackingViewModel.userWeights.last?.id {
//                        Divider()
//                    }
//                }
            }
        }
    }
}

