//
//  CreateGoalRequestDTO.swift
//  ZakFit_front
//
//  Created by Aurélien on 02/01/2025.
//

import Foundation

struct CreateGoalRequestDTO: Codable {
    let goalTypeId: UUID
    let goalStatusId: UUID
    let goalUnitId: UUID?
    let relatedActivityTypeId: UUID?
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
