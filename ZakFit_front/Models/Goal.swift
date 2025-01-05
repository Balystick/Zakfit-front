//
//  Goal.swift
//  ZakFit_front
//
//  Created by Aurélien on 04/01/2025.
//

import Foundation

struct Goal: Identifiable {
    var id: UUID
    var goalType: GoalType
    var goalStatus: String
    var goalUnit: String?
    var relatedActivityType: ActivityType?
    var relatedNutrientId: UUID?
    var targetValue: Double
    var minValue: Double?
    var maxValue: Double?
    var frequency: Int?
    var startDate: String
    var endDate: String?
    var priority: Int
    var description: String?
}

extension Goal {
    func toDTO() -> GoalDTO {
        GoalDTO(
            id: self.id,
            goalType: self.goalType.toDTO(),
            goalStatus: self.goalStatus,
            goalUnit: self.goalUnit,
            relatedActivityType: self.relatedActivityType?.toDTO(),
            relatedNutrientId: self.relatedNutrientId,
            targetValue: self.targetValue,
            minValue: self.minValue,
            maxValue: self.maxValue,
            frequency: self.frequency,
            startDate: self.startDate,
            endDate: self.endDate,
            priority: self.priority,
            description: self.description
        )
    }
}
