//
//  NutritionBalanceView.swift
//  ZakFit_front
//
//  Created by Aurélien on 06/01/2025.
//

import SwiftUI

struct NutritionBalanceView: View {
    @EnvironmentObject var sharedViewModel: SharedViewModel
    @State private var proteinProgress: CGFloat = 0.0
    @State private var carbProgress: CGFloat = 0.0
    @State private var fatProgress: CGFloat = 0.0
    @State private var isVisible: Bool = false

    var body: some View {
        VStack {
            if sharedViewModel.proteinGoalTargetValue == 0 &&
                sharedViewModel.carbsGoalTargetValue == 0 &&
                sharedViewModel.fatsGoalTargetValue == 0 {
                Text("Veuillez définir vos objectifs nutritionnels pour afficher vos macronutriments.")
                    .font(.callout)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            } else {
                ZStack {
                    Circle()
                        .stroke(lineWidth: 15)
                        .opacity(0.3)
                        .foregroundColor(.gray)

                    Circle()
                        .trim(from: 0.0, to: fatProgress)
                        .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round))
                        .foregroundColor(.red)
                        .rotationEffect(Angle(degrees: -90))
                        .animation(.easeInOut(duration: 1), value: fatProgress)

                    Circle()
                        .stroke(lineWidth: 15)
                        .opacity(0.3)
                        .foregroundColor(.gray)
                        .padding(16)

                    Circle()
                        .trim(from: 0.0, to: carbProgress)
                        .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round))
                        .foregroundColor(.yellow)
                        .rotationEffect(Angle(degrees: -90))
                        .padding(16)
                        .animation(.easeInOut(duration: 1), value: carbProgress)

                    Circle()
                        .stroke(lineWidth: 15)
                        .opacity(0.3)
                        .foregroundColor(.gray)
                        .padding(32)

                    Circle()
                        .trim(from: 0.0, to: proteinProgress)
                        .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round))
                        .foregroundColor(.purple)
                        .rotationEffect(Angle(degrees: -90))
                        .padding(32)
                        .animation(.easeInOut(duration: 1), value: proteinProgress)
                    VStack {
                        Text("Δ")
                            .font(.title)
                    }
                }
                .frame(width: 140, height: 140)
                VStack(alignment: .leading) {

                        macronutrientText(label: "Protéines", value: sharedViewModel.proteinsConsumed, goal: sharedViewModel.proteinGoalTargetValue, color: .purple)
                        macronutrientText(label: "Glucides", value: sharedViewModel.carbsConsumed, goal: sharedViewModel.carbsGoalTargetValue, color: .yellow)
                        macronutrientText(label: "Lipides", value: sharedViewModel.fatsConsumed, goal: sharedViewModel.fatsGoalTargetValue, color: .red)
                }
                .padding(.top, 10)
                .frame(maxWidth: .infinity)
                .onAppear {
                    isVisible = true
                    updateProgress()
                }
                .onDisappear {
                    isVisible = false
                }
                .onChange(of: sharedViewModel.proteinsConsumed) {
                    if isVisible { updateProgress() }
                }
                .onChange(of: sharedViewModel.carbsConsumed) {
                    if isVisible { updateProgress() }
                }
                .onChange(of: sharedViewModel.fatsConsumed) {
                    if isVisible { updateProgress() }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 10)
    }

    private func macronutrientText(label: String, value: Double, goal: Double, color: Color) -> some View {
        HStack {
            Circle()
                .frame(width: 10, height: 10)
                .foregroundColor(color)
            Text("\(label): \(Int(value))g / \(Int(goal))g")
                .font(.caption)
                .foregroundColor(Color(.darkGray))
        }
    }

    private func updateProgress() {
        let proteinProgressValue = sharedViewModel.proteinGoalTargetValue > 0
            ? CGFloat(sharedViewModel.proteinsConsumed / sharedViewModel.proteinGoalTargetValue)
            : 0.0

        let carbProgressValue = sharedViewModel.carbsGoalTargetValue > 0
            ? CGFloat(sharedViewModel.carbsConsumed / sharedViewModel.carbsGoalTargetValue)
            : 0.0

        let fatProgressValue = sharedViewModel.fatsGoalTargetValue > 0
            ? CGFloat(sharedViewModel.fatsConsumed / sharedViewModel.fatsGoalTargetValue)
            : 0.0

        withAnimation {
            self.proteinProgress = min(max(proteinProgressValue, 0.0), 1.0)
            self.carbProgress = min(max(carbProgressValue, 0.0), 1.0)
            self.fatProgress = min(max(fatProgressValue, 0.0), 1.0)
        }
    }
}
