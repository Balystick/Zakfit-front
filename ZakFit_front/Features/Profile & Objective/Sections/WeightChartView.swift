//
//  WeightChart - S.swift
//  ZakFit_front
//
//  Created by Aurélien on 16/12/2024.
//

import SwiftUI
import Charts

struct WeightChartView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel

    var body: some View {
        Chart {
            ForEach(profileViewModel.averageWeights, id: \.date) { dataPoint in
                LineMark(
                    x: .value("Date", dataPoint.date, unit: .day),
                    y: .value("Average Weight", dataPoint.average)
                )
                .symbol(Circle())
                .foregroundStyle(.customOrange)
            }

            // Affichage des objectifs
//            if let targetWeight = profileViewModel.targetWeight {
//                RuleMark(y: .value("Objectif", targetWeight))
//                    .foregroundStyle(.green)
//                    .lineStyle(StrokeStyle(lineWidth: 2, dash: [5]))
//                    .annotation(position: .top, alignment: .leading) {
//                        Text("Objectif: \(targetWeight, specifier: "%.1f") kg")
//                            .font(.caption)
//                            .foregroundColor(.green)
//                    }
//            }
        }
        .chartXAxis {
            AxisMarks(position: .bottom)
        }
        .chartYAxis {
            AxisMarks(position: .leading)
        }
        .onAppear {
            Task {
                await profileViewModel.fetchUserWeightsByPeriod()
            }
        }
    }
}

