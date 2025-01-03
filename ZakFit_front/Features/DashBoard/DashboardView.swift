//
//  DashboardView.swift
//  ZakFit_front
//
//  Created by Aurélien on 10/12/2024.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var dashboardViewModel: DashboardViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    AppSection(title: "Données caloriques") {
                        CaloricDataView()
                    }
                    AppSection(title: "Période de suivi") {
                        TrackingPeriodView()
                    }
                    AppSection(title: "Suivi du poids") {
                        WeightTrackingView()
                    }
                }
                .padding()
            }
            .navigationTitle("Tableau de bord")
            .onAppear {
                Task {
                    dashboardViewModel.calculateBMR()
                    dashboardViewModel.calculateTDEE()
                }
            }
        }
        .tint(Color("customOrange"))
    }
}
