//
//  UserWeight.swift
//  ZakFit_front
//
//  Created by Aurélien on 16/12/2024.
//

import SwiftUI

struct UserWeight: Identifiable, Codable {
    let id: UUID
    var dateTime: String
    var weightValue: Double
    
    init(
        id: UUID = UUID(),
        dateTime: String = "",
        weightValue: Double = 0
    ) {
        self.id = id
        self.dateTime = dateTime
        self.weightValue = weightValue
    }
}

extension UserWeight {
    func toUserWeightDTO() -> UserWeightDTO {
        return UserWeightDTO(
            id: self.id,
            dateTime: self.dateTime,
            weightValue: self.weightValue
        )
    }

    func toUserWeightCreateRequestDTO() -> UserWeightCreateRequestDTO {
        return UserWeightCreateRequestDTO(
            dateTime: self.dateTime,
            weightValue: self.weightValue
        )
    }
}
