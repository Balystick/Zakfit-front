//
//  User.swift
//  ZakFit_front
//
//  Created by Aurélien on 10/12/2024.
//

import Foundation

struct User: Codable, Equatable {
    var firstName: String
    var lastName: String
    var email: String
    var dateOfBirth: String
    var height: Double
    var sexe: String
    var activityLevel: String
    
    init(
        firstName: String = "",
        lastName: String = "",
        email: String = "",
        dateOfBirth: String = "",
        height: Double = 0,
        sexe: String = "",
        activityLevel: String = ""
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.dateOfBirth = dateOfBirth
        self.height = height
        self.sexe = sexe
        self.activityLevel = activityLevel
    }
}

extension User {
    func toDTO() -> UserDTO {
        UserDTO(
            firstName: self.firstName,
            lastName: self.lastName,
            email: self.email,
            dateOfBirth: self.dateOfBirth,
            height: self.height,
            sexe: self.sexe,
            activityLevel: self.activityLevel
        )
    }
}
