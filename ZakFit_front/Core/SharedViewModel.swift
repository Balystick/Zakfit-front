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
    @Published var consumedCaloriesGoalTargetValue: Double = 0
    @Published var burnedCaloriesGoalTargetValue: Double = 0
}
