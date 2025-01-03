//
//  ProfileView.swift
//  ZakFit_front
//
//  Created by Aurélien on 12/12/2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel

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
        }
        .tint(Color("customOrange"))
    }
}
