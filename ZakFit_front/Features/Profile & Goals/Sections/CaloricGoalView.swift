//
//  CaloricGoalView.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct CaloricGoalView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @EnvironmentObject var sharedViewModel: SharedViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AppFieldWithEditDouble(
                label: "Consommation",
                value: $sharedViewModel.consumedCaloriesGoalTargetValue,
                unit: "kcal",
                onValueChanged: {
                    if sharedViewModel.consumedCaloriesGoalTargetValue == 0 {
                        if let goalId = profileViewModel.goals.first(where: { $0.goalType.name == "Calories par jour (consommation)" })?.id {
                            await profileViewModel.deleteGoal(goalId: goalId)
                        }
                    } else {
                        await profileViewModel.createOrUpdateConsumedCaloriesGoal(targetValue: sharedViewModel.consumedCaloriesGoalTargetValue)
                    }
                }
            )
            Divider()
            AppFieldWithEditDouble(
                label: "Dépense",
                value: $sharedViewModel.burnedCaloriesGoalTargetValue,
                unit: "kcal",
                onValueChanged: {
                    if sharedViewModel.burnedCaloriesGoalTargetValue == 0 {
                        if let goalId = profileViewModel.goals.first(where: { $0.goalType.name == "Calories par jour (dépense)" })?.id {
                            await profileViewModel.deleteGoal(goalId: goalId)
                        }
                    } else {
                        await profileViewModel.createOrUpdateBurnedCaloriesGoal(targetValue: sharedViewModel.burnedCaloriesGoalTargetValue)
                    }
                }
            )
        }
    }
}

