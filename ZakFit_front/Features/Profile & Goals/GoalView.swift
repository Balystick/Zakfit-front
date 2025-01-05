//
//  GoalView.swift
//  ZakFit_front
//
//  Created by Aurélien on 04/01/2025.
//

import SwiftUI

struct GoalView: View {
    let goal: Goal
    @Binding var updatedGoal: Goal // Pour gérer les modifications si nécessaire

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Titre
            Text(goal.goalType.name)
                .font(.title2)
                .fontWeight(.bold)
            
            // Description
                Text(goal.goalType.description)
                    .font(.body)
                    .foregroundColor(.gray)
            
            
//            // Champs dynamiques en fonction du type d'objectif
//            switch goal.goalType.name {
//            case "Perte de poids", "Maintien", "Prise de masse":
//                AppFieldWithEditDouble(
//                    label: "Valeur cible (kg)",
//                    value: $updatedGoal.targetValue,
//                    unit: "kg"
//                )
//                
//            case "Calories par jour (dépense)", "Calories par séance":
//                AppFieldWithEditDouble(
//                    label: "Calories à dépenser",
//                    value: $updatedGoal.targetValue,
//                    unit: "kcal"
//                )
//                
//            case "Calories par jour (consommation)":
//                AppFieldWithEditDouble(
//                    label: "Calories à consommer",
//                    value: $updatedGoal.targetValue,
//                    unit: "kcal"
//                )
//                
//            case "Fréquence d’entraînement":
//                AppFieldWithEditInt(
//                    label: "Nombre de séances par semaine",
//                    value: $updatedGoal.frequency
//                )
//                
//            case "Durée des séances":
//                AppFieldWithEditInt(
//                    label: "Durée (minutes)",
//                    value: $updatedGoal.frequency,
//                    unit: "min"
//                )
//                
//            case "Type d’activité":
//                if let activity = goal.relatedActivityType {
//                    Text("Activité : \(activity.name)")
//                        .font(.body)
//                    AppFieldWithEditDouble(
//                        label: "Valeur cible",
//                        value: $updatedGoal.targetValue,
//                        unit: "kcal"
//                    )
//                }
//                
//            case "Protéines", "Lipides", "Glucides":
//                AppFieldWithEditDouble(
//                    label: "Valeur minimale (g)",
//                    value: $updatedGoal.minValue
//                )
//                AppFieldWithEditDouble(
//                    label: "Valeur maximale (g)",
//                    value: $updatedGoal.maxValue
//                )
//                
//            case "Nutriments spécifiques":
//                if let nutrientId = goal.relatedNutrientId {
//                    Text("Nutriment ID : \(nutrientId.uuidString)")
//                        .font(.body)
//                    AppFieldWithEditDouble(
//                        label: "Valeur minimale",
//                        value: $updatedGoal.minValue
//                    )
//                    AppFieldWithEditDouble(
//                        label: "Valeur maximale",
//                        value: $updatedGoal.maxValue
//                    )
//                }
//                
//            default:
//                Text("Type d'objectif non pris en charge.")
//                    .foregroundColor(.red)
//            }
        }
        .padding()
    }
}
