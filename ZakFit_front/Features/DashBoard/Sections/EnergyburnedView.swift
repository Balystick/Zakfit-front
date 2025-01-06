//
//  EnergyburnedView.swift
//  ZakFit_front
//
//  Created by Aurélien on 06/01/2025.
//

import SwiftUI

struct EnergyBurnedView: View {
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    @EnvironmentObject var sharedViewModel: SharedViewModel
    @State private var progress: CGFloat = 0.0
    @State private var isVisible: Bool = false
    
    var body: some View {
        VStack {
            if sharedViewModel.burnedEnergy == 0 || sharedViewModel.burnedCaloriesGoalTargetValue == 0 {
                Text("Veuillez enregistrer une activité pour afficher vos calories brûlées.")
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
                        .foregroundColor(.blue)
                        .rotationEffect(Angle(degrees: -90))
                        .animation(.easeInOut(duration: 1), value: progress)
                    
                    VStack {
                        Text("Énergie")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        
                        Text("brûlée")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
            
                        Text("\(Int(sharedViewModel.burnedEnergy)) kcal")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("sur \(Int(sharedViewModel.burnedCaloriesGoalTargetValue)) kcal")
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
                .onChange(of: sharedViewModel.burnedEnergy) {
                    if isVisible { updateProgress() }
                }
                .onChange(of: sharedViewModel.burnedCaloriesGoalTargetValue) {
                    if isVisible { updateProgress() }
                }
            }
        }
        .padding(.vertical, 10)
    }
    
    private func updateProgress() {
        let newProgress = sharedViewModel.burnedCaloriesGoalTargetValue > 0
        ? CGFloat(sharedViewModel.burnedEnergy / sharedViewModel.burnedCaloriesGoalTargetValue)
        : 0.0
        withAnimation {
            self.progress = min(max(newProgress, 0.0), 1.0)
        }
    }
}
