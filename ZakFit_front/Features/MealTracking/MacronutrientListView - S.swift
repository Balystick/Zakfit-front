//
//  MacronutrientListView.swift
//  ZakFit_front
//
//  Created by Aurélien on 15/12/2024.
//

import SwiftUI

struct MacronutrientListView: View {
    @EnvironmentObject var viewModel: MealTrackingViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                if viewModel.foodIsCustom {
                    AppFieldWithPush(
                        label: "Glucides",
                        value: "20",
                        unit: "g",
                        destination: { label in
                            NutrientView(source: label)
                        }
                    )
                    Divider()
                    AppFieldWithPush(
                        label: "Protéines",
                        value: "80",
                        unit: "g",
                        destination: { label in
                            NutrientView(source: label)
                        }
                    )
                    Divider()
                    AppFieldWithPush(
                        label: "Lipides",
                        value: "50",
                        unit: "g",
                        destination: { label in
                            NutrientView(source: label)
                        }
                    )
                } else {
                    AppField(label: "Glucides", value: 20, unit: "g")
                    AppField(label: "Protéines", value: 80, unit: "g")
                    AppField(label: "Lipides", value: 50, unit: "g")
                }
            }
        }
    }
}
    
