//
//  WeightChart - S.swift
//  ZakFit_front
//
//  Created by Aurélien on 16/12/2024.
//

import SwiftUI
import Charts

struct WeightChartView: View {
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    @EnvironmentObject var sharedViewModel: SharedViewModel

    var body: some View {
        if dashboardViewModel.userWeights.isEmpty {
            Text("Aucune donnée disponible pour la période sélectionnée.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            Chart {
                ForEach(dashboardViewModel.averageWeights, id: \.date) { dataPoint in
                    LineMark(
                        x: .value("Date", dataPoint.date, unit: .day),
                        y: .value("Average Weight", dataPoint.average)
                    )
                    .symbol(Circle())
                    .foregroundStyle(.customOrange)
                }
                
                if sharedViewModel.userWeightGoalTargetValue > 0 {
                    RuleMark(y: .value("Objectif", sharedViewModel.userWeightGoalTargetValue))
                        .foregroundStyle(.green)
                        .lineStyle(StrokeStyle(lineWidth: 2, dash: [5]))
                }
            }
            .chartXAxis {
                AxisMarks(position: .bottom)
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .onAppear {
                Task {
                    await dashboardViewModel.fetchUserWeightsByPeriod()
                }
            }
        }
    }
}

