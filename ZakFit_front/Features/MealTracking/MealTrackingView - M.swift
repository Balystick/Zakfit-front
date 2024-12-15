//
//  MealTrackingView.swift
//  ZakFit_front
//
//  Created by Aurélien on 14/12/2024.
//

import SwiftUI

struct MealTrackingView: View {
    @StateObject var viewModel = MealTrackingViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 10) {
                        AppSection(title: "Période de suivi") {
                            MonitoringPeriodView()
                        }
                        AppSection(title: "Repas") {
                            MealListView()
                        }
                    }
                    Color.clear
                        .frame(height: 100)
                }
                .foregroundColor(Color(UIColor.darkGray))
                .padding()
            }
            .navigationTitle("Suivi des repas")
        }
        .environmentObject(viewModel)
        .tint(Color("customOrange"))
    }
}

#Preview {
    MealTrackingView()
}
