//
//  User.swift
//  ZakFit_front
//
//  Created by Aurélien on 10/12/2024.
//

import Foundation

struct User: Codable {
    var firstName: String?
    var lastName: String?
    var email: String
    var dateOfBirth: Date?
    var height: Float?
    var weight: Float?
    var genderID: UUID?
    var userActivityLevelID: UUID?
}
