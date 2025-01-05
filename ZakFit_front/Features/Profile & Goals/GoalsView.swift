//
//  GoalsView.swift
//  ZakFit_front
//
//  Created by Aurélien on 16/12/2024.
//

import SwiftUI

struct GoalsView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @State private var editingGoalID: UUID? = nil
    let goalTypeCategoryName: String
    
    var body: some View {
        Text("Coucou")
//        ScrollView {
//            VStack(alignment: .leading, spacing: 10) {
//                Text(goalTypeCategoryName)
//                    .font(.headline)
//                    .foregroundColor(Color("customOrange"))
//                VStack {
//                    ForEach(profileViewModel.goals.filter { $0.goalType.categoryName == goalTypeCategoryName }) { goal in
//                        HStack {
//                            if editingGoalID == goal.id {
//                                Button(action: {
//                                    Task {
//                                        await profileViewModel.deleteGoal(goalId: goal.id)
//                                        editingGoalID = nil
//                                    }
//                                }) {
//                                    Image(systemName: "trash")
//                                        .foregroundColor(.red)
//                                }
//                                
//                                //                                AppFieldWithEditDouble(
//                                //                                    label: goal.wrappedValue.goalType.name,
//                                //                                    value: $goal.targetValue,
//                                //                                    unit: goal.wrappedValue.goalUnit?.name ?? "",
//                                //                                    startEditing: true,
//                                //                                    onValueChanged: {
//                                //                                        await profileViewModel.updateGoal(
//                                //                                            id: goal.id,
//                                //                                            updatedGoal: goal.toUpdateRequest()
//                                //                                        )
//                                //                                        editingGoalID = nil
//                                //                                    }
//                                //                                )
//                            } else {
//                                HStack {
//                                    VStack(alignment: .leading) {
//                                        Text(goal.goalType.name)
//                                            .fontWeight(.medium)
//                                        if let description = goal.description {
//                                            Text(description)
//                                                .font(.caption)
//                                                .foregroundColor(.gray)
//                                        }
//                                    }
//                                    Spacer()
//                                    Text("\(goal.targetValue, specifier: "%.2f") \(goal.goalUnit?.name ?? "")")
//                                    Image(systemName: "chevron.right")
//                                        .font(.caption)
//                                        .foregroundColor(.gray)
//                                        .padding(.vertical, 10)
//                                }
//                                .onTapGesture {
//                                    editingGoalID = goal.id
//                                }
//                            }
//                        }
//                        if goal.id != profileViewModel.goals.last?.id {
//                            Divider()
//                        }
//                    }
//                    
//                    Divider()
//                    
//                    NavigationLink(destination: GoalTypesView()) {
//                        HStack {
//                            Image(systemName: "plus.circle")
//                                .foregroundColor(Color("customOrange"))
//                            Text("Ajouter un objectif")
//                                .foregroundColor(Color("customOrange"))
//                        }
//                        .padding()
//                    }
//                }
//                .padding()
//                .background(Color(UIColor.systemGray6))
//                .cornerRadius(10)
//            }
//            .padding()
//        }
        .onAppear {
            Task {
                await profileViewModel.fetchAllGoals()
            }
        }
    }
}
//
//struct GGoalListView: View {
//    @EnvironmentObject var profileViewModel: ProfileViewModel
//    @State private var editingGoalID: UUID? = nil
//
//    var body: some View {
//        VStack {
//            if profileViewModel.goals.isEmpty {
//                Text("Aucun objectif défini")
//                    .foregroundColor(.gray)
//                    .multilineTextAlignment(.center)
//                    .padding()
//                    .frame(maxWidth: .infinity)
//            } else {
//                ScrollView {
//                    ForEach(profileViewModel.goals) { goal in
//                        HStack {
//                            if editingGoalID == goal.id {
//                                Button(action: {
//                                    Task {
//                                        await profileViewModel.deleteGoal(goalId: goal.id)
//                                        editingGoalID = nil
//                                    }
//                                }) {
//                                    Image(systemName: "trash")
//                                        .foregroundColor(.red)
//                                }
//
//                                //                                AppFieldWithEditDouble(
//                                //                                    label: goal.wrappedValue.goalType.name,
//                                //                                    value: $goal.targetValue,
//                                //                                    unit: goal.wrappedValue.goalUnit?.name ?? "",
//                                //                                    startEditing: true,
//                                //                                    onValueChanged: {
//                                //                                        await profileViewModel.updateGoal(
//                                //                                            id: goal.id,
//                                //                                            updatedGoal: goal.toUpdateRequest()
//                                //                                        )
//                                //                                        editingGoalID = nil
//                                //                                    }
//                                //                                )
//                            } else {
//                                HStack {
//                                    VStack(alignment: .leading) {
//                                        Text(goal.goalType.name)
//                                            .fontWeight(.medium)
//                                        if let description = goal.description {
//                                            Text(description)
//                                                .font(.caption)
//                                                .foregroundColor(.gray)
//                                        }
//                                    }
//                                    Spacer()
//                                    Text("\(goal.targetValue, specifier: "%.2f") \(goal.goalUnit?.name ?? "")")
//                                    Image(systemName: "chevron.right")
//                                        .font(.caption)
//                                        .foregroundColor(.gray)
//                                        .padding(.vertical, 10)
//                                }
//                                .onTapGesture {
//                                    editingGoalID = goal.id
//                                }
//                            }
//                        }
//                        if goal.id != profileViewModel.goals.last?.id {
//                            Divider()
//                        }
//                    }
//                }
//            }
//
//            Divider()
//
//            NavigationLink(destination: GoalTypesView()) {
//                HStack {
//                    Image(systemName: "plus.circle")
//                        .foregroundColor(Color("customOrange"))
//                    Text("Ajouter un objectif")
//                        .foregroundColor(Color("customOrange"))
//                }
//                .padding()
//            }
//        }
//    }
//}
//
