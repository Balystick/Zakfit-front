//
//  EnergyConsumedView.swift
//  ZakFit_front
//
//  Created by Aurélien on 06/01/2025.
//

import SwiftUI

struct EnergyConsumedView: View {
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    @EnvironmentObject var sharedViewModel: SharedViewModel
    @State private var progress: CGFloat = 0.0
    @State private var isVisible: Bool = false
    
    var body: some View {
        VStack {
            if sharedViewModel.consumedEnergy == 0 || sharedViewModel.consumedCaloriesGoalTargetValue == 0 {
                Text("Veuillez consommer des aliments pour afficher vos calories consommées.")
                    .font(.callout)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            } else {
                ZStack {
                    Circle()
                        .stroke(lineWidth: 20)
                        .opacity(0.3)
                        .foregroundColor(.gray)
                    
                    Circle()
                        .trim(from: 0.0, to: progress)
                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                        .foregroundColor(.green)
                        .rotationEffect(Angle(degrees: -90))
                        .animation(.easeInOut(duration: 1), value: progress)
                    
                    VStack(alignment: .center) {
                        Text("Énergie")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                        Text("consommée")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                        Text("\(Int(sharedViewModel.consumedEnergy)) kcal")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("sur \(Int(sharedViewModel.consumedCaloriesGoalTargetValue)) kcal")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .frame(width: 140, height: 140)
                .onAppear {
                    isVisible = true
                    updateProgress()
                }
                .onDisappear {
                    isVisible = false
                }
                .onChange(of: sharedViewModel.consumedEnergy) {
                    if isVisible { updateProgress() }
                }
                .onChange(of: sharedViewModel.consumedCaloriesGoalTargetValue) {
                    if isVisible { updateProgress() }
                }
            }
        }
        .padding(.vertical, 10)
    }
    
    private func updateProgress() {
        let newProgress = sharedViewModel.consumedCaloriesGoalTargetValue > 0
        ? CGFloat(sharedViewModel.consumedEnergy / sharedViewModel.consumedCaloriesGoalTargetValue)
        : 0.0
        withAnimation {
            self.progress = min(max(newProgress, 0.0), 1.0)
        }
    }
}
