//
//  ActivityGoalsView.swift
//  ZakFit_front
//
//  Created by Aurélien on 05/01/2025.
//

import SwiftUI

struct ActivityGoalsView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @Binding var isModalPresented: Bool
    @Binding var selectedGoalTypeCategory: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if profileViewModel.goals.contains(where: { $0.goalType.categoryName == "Objectifs d’activités" }) {
                Text("il y a un objectif")
            } else {
                HStack {
                    Button("Ajouter un objectif") {
                        isModalPresented = true
                        selectedGoalTypeCategory = "Objectifs d’activités"
                    }
                    .foregroundColor(Color("customOrange"))
                    Spacer()
                }
            }
        }
    }
}
