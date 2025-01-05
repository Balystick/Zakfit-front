//
//  FoodPreferencesView.swift
//  ZakFit_front
//
//  Created by Aurélien on 12/12/2024.
//

import SwiftUI

struct FoodPreferencesView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            AppFieldWithLink(
                label: "Type de régime",
                value: "Végétarien",
                destination: {
                    ActivityGoalsView()
                }
            )
            Divider()
            Button(action: {
            }) {
                Text("Modifier les préférences alimentaires")
                    .foregroundColor(Color("customOrange"))
            }
        }
    }
}
