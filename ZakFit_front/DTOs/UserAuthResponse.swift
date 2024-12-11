//
//  UserAuthResponse.swift
//  ZakFit_front
//
//  Created by Aurélien on 10/12/2024.
//

struct UserAuthResponse: Codable {
    let token: String
    let user: User
}
