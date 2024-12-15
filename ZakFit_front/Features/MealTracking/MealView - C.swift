//
//  MealDetailView.swift
//  ZakFit_front
//
//  Created by Aurélien on 14/12/2024.
//

import SwiftUI

struct MealView: View {
    let source: String
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AppSection(
                    title: "Détail du repas") {
                        MealDescView()
                    }
                AppSection(
                    title: "Liste des aliments") {
                        FoodListView()
                    }
            }
            .padding()
            Color.clear
                .frame(height: 115)
        }
        .foregroundColor(Color(UIColor.darkGray))
    }
}

