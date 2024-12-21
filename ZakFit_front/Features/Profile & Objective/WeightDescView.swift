//
//  WeightDescView.swift
//  ZakFit_front
//
//  Created by Aurélien on 16/12/2024.
//

import SwiftUI

struct WeightDescView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AppSection(title: "Période de suivi") {
                    WeightPeriodView()
                }
                AppSection(title: "Poids") {
                    WeightEditView()
                }
                AppSection(title: "Moyenne par période") {
                    WeightChartView()
                }
                AppSection(title: "Toutes les données de la période") {
                    WeightListView()
                }
            }
            .padding()
            Color.clear
                .frame(height: 115)
        }
        .foregroundColor(Color(UIColor.darkGray))
    }
}

