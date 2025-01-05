//
//  UpdateGoalRequestDTO.swift
//  ZakFit_front
//
//  Created by Aurélien on 02/01/2025.
//

import Foundation

struct UpdateGoalRequestDTO: Codable {
    let goalTypeId: UUID?
    let goalStatus: String?
    let goalUnit: String?
    let relatedActivityTypeId: UUID?
    let relatedNutrientId: UUID?
    let targetValue: Double?
    let minValue: Double?
    let maxValue: Double?
    let frequency: Int?
    let startDate: String?
    let endDate: String?
    let priority: Int?
    let description: String?
}
