//
//  CaloricDataView.swift
//  ZakFit_front
//
//  Created by Aurélien on 02/01/2025.
//

import SwiftUI

struct CaloricDataView: View {
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    @State private var progress: CGFloat = 0.0
    @State private var isVisible: Bool = false

    var body: some View {
        VStack {
            if dashboardViewModel.bmr == 0 || dashboardViewModel.tdee == 0 {
                Text("Veuillez compléter vos informations dans votre profil pour afficher vos données caloriques.")
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
                        .foregroundColor(.orange)
                        .rotationEffect(Angle(degrees: -90))
                        .animation(.easeInOut(duration: 1), value: progress)
                    
                    VStack {
                            Text("BMR / TDEE")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                        Text("\(Int(dashboardViewModel.bmr)) kcal")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("sur \(Int(dashboardViewModel.tdee)) kcal")
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
                .onChange(of: dashboardViewModel.bmr) {
                    if isVisible { updateProgress() }
                }
                .onChange(of: dashboardViewModel.tdee) {
                    if isVisible { updateProgress() }
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 10)
    }
    
    private func updateProgress() {
        let newProgress = dashboardViewModel.tdee > 0 ? CGFloat(dashboardViewModel.bmr / dashboardViewModel.tdee) : 0.0
        withAnimation {
            self.progress = min(max(newProgress, 0.0), 1.0)
        }
    }
}

