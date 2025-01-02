//
//  MicronutrientListView.swift
//  ZakFit_front
//
//  Created by Aurélien on 15/12/2024.
//

import SwiftUI

struct NutrientListView: View {
    @EnvironmentObject var mealTrackingViewModel: MealTrackingViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                AppFieldWithLink(
                    label: "Nouveau nutriment",
                    value: "Ajouter",
                    destination: { NutrientView(source: "") }
                )
                Divider()
//                AppFieldWithPush(
//                    label: "Nutriment 1",
//                    value: "20",
//                    unit: "mg",
//                    destination: { label in
//                        NutrientView(source: label)
//                    }
//                )
                Divider()
//                AppFieldWithPush(
//                    label: "Nutriment 2",
//                    value: "80",
//                    unit: "mg",
//                    destination: { label in
//                        NutrientView(source: label)
//                    }
//                )
                Divider()
//                AppFieldWithPush(
//                    label: "Nutriment 3",
//                    value: "50",
//                    unit: "mg",
//                    destination: { label in
//                        NutrientView(source: label)
//                    }
//                )
            }
        }
    }
}
