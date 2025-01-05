//
//  ActivityTypeDTO.swift
//  ZakFit_front
//
//  Created by Aurélien on 02/01/2025.
//

import Foundation

struct ActivityTypeDTO: Codable {
    let id: UUID
    let name: String
    let description: String?
    let caloriesPerMinute: Double
    let isCustom: Bool
}

extension ActivityTypeDTO {
    func toModel() -> ActivityType {
        return ActivityType(
            id: self.id,
            name: self.name,
            description: self.description,
            caloriesPerMinute: self.caloriesPerMinute,
            isCustom: self.isCustom
        )
    }
}
