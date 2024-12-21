//
//  APIErrorDTO.swift
//  ZakFit_front
//
//  Created by Aurélien on 10/12/2024.
//

struct APIErrorDTO: Decodable {
    let reason: String
    let error: Bool
}
