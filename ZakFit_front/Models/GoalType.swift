//
//  GoalType.swift
//  ZakFit_front
//
//  Created by Aurélien on 04/01/2025.
//

import Foundation

struct GoalType: Identifiable {
    var id: UUID
    var name: String
    var description: String
    var order: Int
    var categoryName: String
}

extension GoalType {
    func toDTO() -> GoalTypeDTO {
        GoalTypeDTO(
            id: self.id,
            name: self.name,
            description: self.description,
            order: self.order,
            categoryName: self.categoryName
        )
    }
}
