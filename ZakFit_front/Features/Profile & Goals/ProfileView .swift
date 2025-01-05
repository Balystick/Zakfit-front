//
//  ProfileView.swift
//  ZakFit_front
//
//  Created by Aurélien on 12/12/2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @State private var isModalPresented: Bool = false
    @State private var selectedGoalTypeCategory: String = ""

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
                    AppSection(title: "Objectif calorique quotidien") {
                        CaloricGoalView()
                    }
                    AppSection(title: "Préférences alimentaires") {
                        FoodPreferencesView(isModalPresented: $isModalPresented, selectedGoalTypeCategory: $selectedGoalTypeCategory)
                    }
                    AppSection(title: "Objectifs d'activités physiques") {
                        ActivityGoalsView(isModalPresented: $isModalPresented, selectedGoalTypeCategory: $selectedGoalTypeCategory)
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
                        Text("Déconnexion")
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
            .navigationTitle("Profil & objectifs")
            .onAppear {
                Task {
                    await profileViewModel.fetchAllGoals()
                    await profileViewModel.fetchGoalTypes()
                    profileViewModel.loadGoalsTargetValues()
                }
            }
        }
        .tint(Color("customOrange"))
        .sheet(isPresented: $isModalPresented) {
            GoalAddView(isModalPresented: $isModalPresented, selectedGoalTypeCategory: $selectedGoalTypeCategory)
        }
    }
}
