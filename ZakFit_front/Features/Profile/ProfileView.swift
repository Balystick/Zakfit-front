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
                    
                    AppSection(title: "Consommation énergétique") {
                        EnergyConsumptionView()
                    }
                    
                    AppSection(title: "Dépense énergétique") {
                        EnergyExpenditureView()
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
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.white, Color(UIColor.systemGray6)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .navigationTitle("Profil")
            .onAppear {
                viewModel.loadProfile()
            }
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    ProfileView()
}
