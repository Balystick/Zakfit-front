//
//  BMRView.swift
//  ZakFit_front
//
//  Created by Aurélien on 02/01/2025.
//

import SwiftUI

struct BMRView: View {
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    @State private var progress: CGFloat = 0.0
    @State private var isVisible: Bool = false
    @State private var showInfoSheet: Bool = false

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
                        Button(action: {
                            showInfoSheet = true
                        }) {
                            Text("BMR")
                                .font(.headline)
                                .foregroundColor(.orange)
                            Image(systemName: "info.circle")
                                .foregroundColor(.orange)
                                .font(.headline)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        Text("\(Int(dashboardViewModel.bmr)) kcal")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("sur \(Int(dashboardViewModel.tdee)) kcal")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .frame(width: 200, height: 200)
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
            }
        }
        .padding()
        .sheet(isPresented: $showInfoSheet) {
            BMRInfoSheetView(isPresented: $showInfoSheet)
        }
    }
    
    private func updateProgress() {
        let newProgress = dashboardViewModel.tdee > 0 ? CGFloat(dashboardViewModel.bmr / dashboardViewModel.tdee) : 0.0
        withAnimation {
            self.progress = min(max(newProgress, 0.0), 1.0)
        }
    }
}
