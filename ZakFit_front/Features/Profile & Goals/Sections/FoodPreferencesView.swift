//
//  FoodPreferencesView.swift
//  ZakFit_front
//
//  Created by Aurélien on 12/12/2024.
//

import SwiftUI

struct FoodPreferencesView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @Binding var isModalPresented: Bool
    @Binding var selectedGoalTypeCategory: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if profileViewModel.goals.contains(where: { $0.goalType.categoryName == "Objectifs nutritionnels" }) {
                Text("il y a un objectif")
            } else {
                HStack {
                    Button("Ajouter une préférence") {
                        isModalPresented = true
                        selectedGoalTypeCategory = "Objectifs nutritionnels"
                    }
                    .foregroundColor(Color("customOrange"))
                Spacer()
                }
            }
        }
    }
}
