//
//  UpdatePasswordDTO.swift
//  ZakFit_front
//
//  Created by Aurélien on 21/12/2024.
//

struct UpdatePasswordDTO: Codable {
    let oldPassword: String
    let newPassword: String
    let confirmPassword: String
}
