//
//  ProfileView.swift
//  ZakFit_front
//
//  Created by Aurélien on 12/12/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()

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
                    }) {
                        Text("Déconnexion")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
                .padding()
            }
            .navigationTitle("Profile & objectifs")
            .foregroundColor(Color(UIColor.darkGray))
            .onAppear {
                viewModel.loadProfile()
            }
        }
        .environmentObject(viewModel)
        .tint(.orange)
    }
}

#Preview {
    ProfileView()
}
