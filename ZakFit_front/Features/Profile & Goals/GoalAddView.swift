//
//  GoalAddView.swift
//  ZakFit_front
//
//  Created by Aurélien on 04/01/2025.
//

import SwiftUI

struct GoalAddView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @Binding var isModalPresented: Bool
    @Binding var selectedGoalTypeCategory: String

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(selectedGoalTypeCategory)
                        .font(.headline)
                        .foregroundColor(Color("customOrange"))
                    VStack(spacing: 10) {
                        ForEach(profileViewModel.goalTypes.filter { $0.categoryName == selectedGoalTypeCategory }) { goalType in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(goalType.name)
                                        .fontWeight(.bold)
                                    Text(goalType.description)
                                        .font(.body)
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            if let lastFilteredGoalType = profileViewModel.goalTypes.filter({ $0.categoryName == selectedGoalTypeCategory }).last,
                               goalType.id != lastFilteredGoalType.id {
                                Divider()
                            }
                        }
                    }
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    Button(action: {
                        isModalPresented = false
                    }) {
                        Text("Valider")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("customOrange"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
                .padding()
            }
        }
    }
}
