//
//  GoalAddView.swift
//  ZakFit_front
//
//  Created by Aurélien on 04/01/2025.
//

import SwiftUI

struct GoalAddView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    let goalType: GoalType
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    AppSection(title: "Niveau d'activité physique") {
                        ActivityLevelView()
                    }
                    AppSection(title: "Poids") {
                        WeightView()
                    }
                    AppSection(title: "Bilan énergétique") {
                        EnergyBalanceView()
                    }
                    AppSection(title: "Préférences alimentaires") {
                        FoodPreferencesView()
                    }
                    AppSection(title: "Notifications et rappels") {
                        NotificationsView()
                    }
                    AppSection(title: "Informations personnelles") {
                        PersonalInfoView()
                    }
                    
                    Button(action: {
                        profileViewModel.logout()
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
        .tint(Color("customOrange"))
    }
}
