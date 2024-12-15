//
//  FoodView.swift
//  ZakFit_front
//
//  Created by Aurélien on 14/12/2024.
//

import SwiftUI

struct FoodView: View {
    let source: String
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AppSection(
                    title: "Détail de l'aliment") {
                        FoodDescView()
                    }
                AppSection(
                    title: "Quantité consommée") {
                        FoodQuantityView()
                    }
                AppSection(
                    title: "Valeur énergétique pour 100 g") {
                        FoodEnergyView()
                    }
                AppSection(
                    title: "Teneur en macronutriments pour 100 g") {
                        MacronutrientListView()
                    }
                AppSection(
                    title: "Teneur en nutriments pour 100 g") {
                        NutrientListView()
                    }
            }
            .padding()
            Color.clear
                .frame(height: 115)
        }
        .foregroundColor(Color(UIColor.darkGray))
    }
}
