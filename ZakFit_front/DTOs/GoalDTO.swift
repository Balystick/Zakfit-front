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
    let goalUnit: GoalUnitDTO?
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
