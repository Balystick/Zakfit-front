//
//  APIRequestError.swift
//  ZakFit_front
//
//  Created by Aurélien on 10/12/2024.
//

import Foundation

enum APIRequestError: Error, LocalizedError {
    case invalidURL
    case encodingFailed
    case networkError(error: Error)
    case decodingFailed
    case serverError(statusCode: Int)
    case invalidResponse

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "URL invalide."
        case .encodingFailed:
            return "Échec de l'encodage des données."
        case .networkError(let error):
            return "Erreur réseau : \(error.localizedDescription)."
        case .decodingFailed:
            return "Impossible de décoder la réponse."
        case .serverError(let statusCode):
            return "Erreur serveur avec le code \(statusCode)."
        case .invalidResponse:
            return "Réponse invalide ou inattendue."
        }
    }
}
