//
//  ActivityView.swift
//  ZakFit_front
//
//  Created by Aurélien on 14/12/2024.
//

import SwiftUI

struct MealView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                AppFieldWithLink(
                    label: "Nouveau repas",
                    value: "Ajouter",
                    destination: {
                        AddMealView() }
                )
                Divider()
                AppFieldWithPush(
                    label: "14/12/2024 09:21",
                    value: "Petit-déjeuner",
                    unit: "",
                    destination: { label in
                        MealDetailView(source: label) }
                )
                Divider()
                AppFieldWithPush(
                    label: "14/12/2024 12:14",
                    value: "Déjeuner",
                    unit: "",
                    destination: { label in
                        MealDetailView(source: label) }
                )
                Divider()
                AppFieldWithPush(
                    label: "14/12/2024 16:23",
                    value: "Collation",
                    unit: "",
                    destination: { label in
                        MealDetailView(source: label) }
                )
                Divider()
                AppFieldWithPush(
                    label: "14/12/2024 19:32",
                    value: "Dîner",
                    unit: "",
                    destination: { label in
                        MealDetailView(source: label) }
                )
                Divider()
                AppFieldWithPush(
                    label: "13/12/2024",
                    value: "Petit-déjeuner",
                    unit: "",
                    destination: { label in
                        MealDetailView(source: label) }
                )
                Divider()
                AppFieldWithPush(
                    label: "13/12/2024",
                    value: "Déjeuner",
                    unit: "",
                    destination: { label in
                        MealDetailView(source: label) }
                )
            }
            .foregroundColor(Color(UIColor.darkGray))
        }
    }
}

