//
//  APIManager.swift
//  ZakFit_front
//
//  Created by Aurélien on 10/12/2024.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    private(set) var latestErrorResponseData: Data?
    
    private init() {}
    
    func sendRequest<T: Decodable, U: Encodable>(
        to url: String,
        method: String = "POST",
        body: U? = nil,
        headers: [String: String] = ["Content-Type": "application/json"],
        responseType: T.Type
    ) async throws -> T {
        guard let requestURL = URL(string: url) else {
            throw APIRequestError.invalidURL
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = method
        
        headers.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        if let body = body {
            do {
                request.httpBody = try JSONEncoder().encode(body)
            } catch {
                throw APIRequestError.encodingFailed
            }
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                latestErrorResponseData = data
                throw APIRequestError.serverError(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 0)
            }
            
            latestErrorResponseData = nil
            
            do {
                let decodedResponse = try JSONDecoder().decode(responseType, from: data)
                return decodedResponse
            } catch {
                throw APIRequestError.decodingFailed
            }
        }
    }
}

extension APIManager {
    func handleServerError(data: Data) -> String {
        guard let serverMessage = try? JSONDecoder().decode(APIError.self, from: data) else {
            return "Une erreur est survenue. Veuillez vérifier vos informations."
        }
        
        switch serverMessage.reason {
        case "An account with this email already exists.":
            return "Cette adresse e-mail est déjà associée à un compte. Veuillez utiliser une autre adresse ou vous connecter."
        case "Invalid email or password.":
            return "Impossible de se connecter, veuillez vérifier vos informations."
        default:
            return serverMessage.reason
        }
    }
}
