//
//  GoalView.swift
//  ZakFit_front
//
//  Created by Aurélien on 14/12/2024.
//

import SwiftUI

struct NutritionGoalsExtView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Calories consommées :")
                    .fontWeight(.medium)
                Text("1500")
                    .fontWeight(.medium)
                    .foregroundColor(Color(red: 0.0, green: 0.5, blue: 0.0))
                Text("/ 4000 kcal")
                    .fontWeight(.medium)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Text("Glucides :")
                    .fontWeight(.medium)
                Text("2500")
                    .fontWeight(.medium)
                    .foregroundColor(Color(red: 0.7, green: 0.0, blue: 0.0))
                Text("/ 1000 g")
                    .fontWeight(.medium)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Text("Lipides :")
                    .fontWeight(.medium)
                Text("1500")
                    .fontWeight(.medium)
                    .foregroundColor(Color(red: 0.0, green: 0.5, blue: 0.0))
                Text("/ 3000 g")
                    .fontWeight(.medium)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Text("Protéines :")
                    .fontWeight(.medium)
                Text("36")
                    .fontWeight(.medium)
                    .foregroundColor(Color(red: 0.0, green: 0.5, blue: 0.0))
                Text("/ 100 g")
                    .fontWeight(.medium)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Text("AG monoinsaturés :")
                    .fontWeight(.medium)
                Text("1,3")
                    .fontWeight(.medium)
                    .foregroundColor(Color(red: 0.7, green: 0.0, blue: 0.0))
                Text("/ 3 mg")
                    .fontWeight(.medium)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
        .padding(.top, 5)
        .padding(.bottom, 15)
        .foregroundColor(Color(UIColor.darkGray))
        .background(Color(UIColor.systemGray6))
    }
}

#Preview {
    NutritionGoalsExtView()
}
