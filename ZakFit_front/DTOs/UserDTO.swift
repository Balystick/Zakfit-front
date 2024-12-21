//
//  UserDTO.swift
//  ZakFit_front
//
//  Created by Aurélien on 18/12/2024.
//

import Foundation

struct UserDTO: Codable {
    var firstName: String
    var lastName: String
    var email: String
    var dateOfBirth: String
    var height: Double
    var sexe: String
    var activityLevel: String
}

extension UserDTO {
    func toModel() -> User {
        return User(
            firstName: firstName,
            lastName: lastName,
            email: email,
            dateOfBirth: dateOfBirth,
            height: height,
            sexe: sexe,
            activityLevel: activityLevel
        )
    }
}
