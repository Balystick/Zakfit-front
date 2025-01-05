//
//  GoalDTO.swift
//  ZakFit_front
//
//  Created by Aurélien on 02/01/2025.
//

import Foundation

struct GoalDTO: Codable {
    let id: UUID
    let goalType: GoalTypeDTO
    let goalStatus: String
    let goalUnit: String?
    let relatedActivityType: ActivityTypeDTO?
    let relatedNutrientId: UUID?
    let targetValue: Double
    let minValue: Double?
    let maxValue: Double?
    let frequency: Int?
    let startDate: String
    let endDate: String?
    let priority: Int
    let description: String?
}

extension GoalDTO {
    func toModel() -> Goal {
        return Goal(
            id: self.id,
            goalType: self.goalType.toModel(),
            goalStatus: self.goalStatus,
            goalUnit: self.goalUnit,
            relatedActivityType: self.relatedActivityType?.toModel(),
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
