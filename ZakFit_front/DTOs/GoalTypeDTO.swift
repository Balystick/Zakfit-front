//
//  GoalTypeDTO.swift
//  ZakFit_front
//
//  Created by Aurélien on 02/01/2025.
//

import Foundation

struct GoalTypeDTO: Codable {
    let id: UUID
    let name: String
    let description: String
    let order: Int
    let categoryName: String
}

extension GoalTypeDTO {
    func toModel() -> GoalType {
        GoalType(
            id: id,
            name: name,
            description: description,
            order: order,
            categoryName: categoryName
        )
    }
}
