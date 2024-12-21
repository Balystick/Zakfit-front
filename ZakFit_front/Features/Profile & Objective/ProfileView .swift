//
//  ProfileView.swift
//  ZakFit_front
//
//  Created by Aurélien on 12/12/2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    AppSection(title: "Niveau d'activité physique") {
                        ActivityLevelView()
                    }
                    AppSection(title: "Poids") {
                        WeightPushView()
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
                        KeychainManager.deleteTokenFromKeychain()
                        authViewModel.isAuthenticated = false
                        authViewModel.currentUser = nil
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
            .navigationTitle("Profile & objectifs")
            .onAppear {
                Task {
                    await profileViewModel.fetchLastUserWeight()
                }
            }
        }
    }
}
