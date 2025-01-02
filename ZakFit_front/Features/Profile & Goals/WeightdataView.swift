//
//  WeightdataView.swift
//  ZakFit_front
//
//  Created by Aurélien on 16/12/2024.
//

import SwiftUI

struct WeightDataView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AppSection(title: "Suivi du poids") {
                    WeightListView()
                }
            }
            .padding()
        }
        .foregroundColor(Color(UIColor.darkGray))
        .onAppear {
            Task {
                await profileViewModel.fetchAllUserWeights()
            }
        }
    }
}
