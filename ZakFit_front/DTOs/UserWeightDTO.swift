//
//  UserWeightDTO.swift
//  ZakFit_front
//
//  Created by Aurélien on 16/12/2024.
//

import Foundation

struct UserWeightDTO: Codable, Identifiable {
    let id: UUID
    let dateTime: String
    let weightValue: Double
}

extension UserWeightDTO {
    func toModel() -> UserWeight {
        return UserWeight(
            id: self.id,
            dateTime: self.dateTime,
            weightValue: self.weightValue
        )
    }
}
