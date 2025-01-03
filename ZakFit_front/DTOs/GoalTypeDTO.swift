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
}
