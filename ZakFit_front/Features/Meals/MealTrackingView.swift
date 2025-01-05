//
//  MealTrackingView.swift
//  ZakFit_front
//
//  Created by Aurélien on 14/12/2024.
//

import SwiftUI

struct MealTrackingView: View {
    @EnvironmentObject var mealTrackingViewModel: DashboardViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 10) {
                        AppSection(title: "Filtrer par date") {
                            MealFilterView()
                        }
                        AppSection(title: "Suivi des repas") {
                            MealListView()
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Repas")
        }
        .tint(Color("customOrange"))
    }
}

#Preview {
    MealTrackingView()
}
