//
//  FoodPreferencesView.swift
//  ZakFit_front
//
//  Created by Aurélien on 12/12/2024.
//

import SwiftUI

struct FoodPreferencesView: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Type de régime")
                    .fontWeight(.medium)
                Spacer()
                Text("Végétarien")
            }
            Divider()
            Button(action: {
            }) {
                Text("Modifier les préférences alimentaires")
                    .foregroundColor(Color("customOrange"))
            }
        }
    }
}
