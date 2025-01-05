//
//  ActivityType.swift
//  ZakFit_front
//
//  Created by Aurélien on 04/01/2025.
//

import Foundation

struct ActivityType: Identifiable {
    var id: UUID
    var name: String
    var description: String?
    var caloriesPerMinute: Double
    var isCustom: Bool
}

extension ActivityType {
    func toDTO() -> ActivityTypeDTO {
        ActivityTypeDTO(
            id: self.id,
            name: self.name,
            description: self.description,
            caloriesPerMinute: self.caloriesPerMinute,
            isCustom: self.isCustom
        )
    }
}

