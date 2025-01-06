//
//  SharedViewModel.swift
//  ZakFit_front
//
//  Created by Aurélien on 10/12/2024.
//

import Foundation

class SharedViewModel: ObservableObject, @unchecked Sendable {
    @Published var isAuthenticated: Bool = false
    @Published var user: User = User()
    @Published var lastUserWeight: UserWeight = UserWeight()
    @Published var userWeightGoalTargetValue: Double = 0
    @Published var consumedCaloriesGoalTargetValue: Double = 2000
    @Published var burnedCaloriesGoalTargetValue: Double = 2500
    @Published var consumedEnergy: Double = 1350
    @Published var burnedEnergy: Double = 780
    @Published var proteinGoalTargetValue: Double = 450
    @Published var carbsGoalTargetValue: Double = 300
    @Published var fatsGoalTargetValue: Double = 900
    @Published var proteinsConsumed: Double = 375
    @Published var carbsConsumed: Double = 250
    @Published var fatsConsumed: Double = 600

}
