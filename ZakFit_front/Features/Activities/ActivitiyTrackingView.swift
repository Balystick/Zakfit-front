//
//  ActivityTrackingView.swift
//  ZakFit_front
//
//  Created by Aurélien on 30/12/2024.
//

import SwiftUI

struct ActivityTrackingView: View {
    @EnvironmentObject var activitiyTrackingViewModel: ActivityTrackingViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    AppSection(title: "Période de suivi") {
                        ActivityFilterView()
                    }
                    AppSection(title: "Suivi des activités") {
                        ActivityListView()
                    }
                }
                .padding()
            }
            .navigationTitle("Activités")
        }
        .tint(Color("customOrange"))
    }
}
