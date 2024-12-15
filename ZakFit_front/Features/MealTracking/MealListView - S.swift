//
//  ActivityView.swift
//  ZakFit_front
//
//  Created by Aurélien on 14/12/2024.
//

import SwiftUI

struct MealListView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                AppFieldWithLink(
                    label: "Nouveau repas",
                    value: "Ajouter",
                    destination: {
                        MealView(source: "") }
                )
                Divider()
                AppFieldWithPush(
                    label: "14/12/2024 09:21",
                    value: "Petit-déjeuner",
                    unit: "",
                    destination: { label in
                        MealView(source: label) }
                )
                Divider()
                AppFieldWithPush(
                    label: "14/12/2024 12:14",
                    value: "Déjeuner",
                    unit: "",
                    destination: { label in
                        MealView(source: label) }
                )
                Divider()
                AppFieldWithPush(
                    label: "14/12/2024 16:23",
                    value: "Collation",
                    unit: "",
                    destination: { label in
                        MealView(source: label) }
                )
                Divider()
                AppFieldWithPush(
                    label: "14/12/2024 19:32",
                    value: "Dîner",
                    unit: "",
                    destination: { label in
                        MealView(source: label) }
                )
                Divider()
                AppFieldWithPush(
                    label: "13/12/2024",
                    value: "Petit-déjeuner",
                    unit: "",
                    destination: { label in
                        MealView(source: label) }
                )
                Divider()
                AppFieldWithPush(
                    label: "13/12/2024",
                    value: "Déjeuner",
                    unit: "",
                    destination: { label in
                        MealView(source: label) }
                )
            }
            .foregroundColor(Color(UIColor.darkGray))
        }
    }
}

