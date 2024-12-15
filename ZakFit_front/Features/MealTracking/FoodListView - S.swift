//
//  FoodListView.swift
//  ZakFit_front
//
//  Created by Aurélien on 14/12/2024.
//

import SwiftUI

struct FoodListView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                AppFieldWithLink(
                    label: "Nouvel aliment",
                    value: "Ajouter",
                    destination: {
                        FoodView(source: "")
                    }
                )
                Divider()
                AppFieldWithPush(
                    label: "Aliment 1",
                    value: 200,
                    unit: "g",
                    destination: { label in
                        FoodView(source: label)
                    }
                )
                Divider()
                AppFieldWithPush(
                    label: "Aliment 2",
                    value: 100,
                    unit: "g",
                    destination: { label in
                        FoodView(source: label)
                    }
                )
                Divider()
                AppFieldWithPush(
                    label: "Aliment 3",
                    value: 75,
                    unit: "g",
                    destination: { label in
                        FoodView(source: label) }
                )
                Divider()
                AppFieldWithPush(
                    label: "Aliment 4",
                    value: 24,
                    unit: "g",
                    destination: { label in
                        FoodView(source: label) }
                )
                Divider()
                AppFieldWithPush(
                    label: "Aliment 5",
                    value: 150,
                    unit: "g",
                    destination: { label in
                        FoodView(source: label) }
                )
                Divider()
                AppFieldWithPush(
                    label: "Aliment 6",
                    value: "60",
                    unit: "g",
                    destination: { label in
                        FoodView(source: label) }
                )
            }
            .foregroundColor(Color(UIColor.darkGray))
        }
    }
}

#Preview {
    FoodListView()
}
