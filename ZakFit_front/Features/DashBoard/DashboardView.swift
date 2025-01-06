//
//  DashboardView.swift
//  ZakFit_front
//
//  Created by Aurélien on 10/12/2024.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    @State private var showInfoSheet: Bool = false
    @State private var showInfoType: String = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    HStack {
                        AppSectionWithInfo(
                            title: "Données caloriques",
                            infoType: "caloricData",
                            showInfoSheet: $showInfoSheet,
                            showInfoType: $showInfoType
                        ) {
                            CaloricDataView()
                        }
                        AppSectionWithInfo(
                            title: "Équilibre nutritionnel",
                            infoType: "nutritionalBalance",
                            showInfoSheet: $showInfoSheet,
                            showInfoType: $showInfoType
                        ) {
                            NutritionBalanceView()
                        }
                    }
                    AppSectionWithInfo(
                        title: "Bilan énergétique",
                        infoType: "energyBalance",
                        showInfoSheet: $showInfoSheet,
                        showInfoType: $showInfoType
                    ) {
                        EnergyDataView()
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
        .sheet(isPresented: $showInfoSheet) {
            InfoSheetView(isPresented: $showInfoSheet, showInfoType: $showInfoType)
        }
    }
}
