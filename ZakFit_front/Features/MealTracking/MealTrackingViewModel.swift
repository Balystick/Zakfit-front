
//
//  MealTrackingViewModel.swift
//  ZakFit_front
//
//  Created by Aurélien on 14/12/2024.
//

import Foundation

class MealTrackingViewModel: ObservableObject {
    @Published var monitoringPeriod: String = "Aujourd'hui"
    let monitoringPeriodOptions = [
        "Aujourd'hui",
        "Semaine",
        "Mois"
    ]

}
