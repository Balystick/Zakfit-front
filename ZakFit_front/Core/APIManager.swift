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
        
        if let token = KeychainManager.getTokenFromKeychain() {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        headers.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        if method != "GET", let body = body {
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
            
            if data.isEmpty, responseType == EmptyBody.self {
                return EmptyBody() as! T
            }
            
            do {
                return try JSONDecoder().decode(responseType, from: data)
            } catch {
                throw APIRequestError.decodingFailed
            }
        } catch {
            print("Caught error: \(error)")
            throw error
        }
    }
}

extension APIManager {
    
    // UserAuth
    func loginUser(email: String, password: String) async throws -> UserAuthResponseDTO {
        let userAuthRequest = UserAuthRequestDTO(email: email, password: password)
        return try await sendRequest(
            to: "http://127.0.0.1:8080/user/login",
            method: "POST",
            body: userAuthRequest,
            responseType: UserAuthResponseDTO.self
        )
    }
    
    func registerUser(email: String, password: String) async throws -> UserAuthResponseDTO {
        let userAuthRequestDTO = UserAuthRequestDTO(email: email, password: password)
        return try await sendRequest(
            to: "http://127.0.0.1:8080/user/create",
            method: "POST",
            body: userAuthRequestDTO,
            responseType: UserAuthResponseDTO.self
        )
    }
    
    func updatePassword(oldPassword: String, newPassword: String, confirmPassword: String) async throws {
        let updatePasswordDTO = UpdatePasswordDTO(
            oldPassword: oldPassword,
            newPassword: newPassword,
            confirmPassword: confirmPassword
        )
        
        _ = try await sendRequest(
            to: "http://127.0.0.1:8080/user/update-password",
            method: "POST",
            body: updatePasswordDTO,
            responseType: EmptyBody.self
        )
    }
    
    // Profile
    func updateUser(_ userUpdate: User) async throws -> UserDTO {
        let url = "http://127.0.0.1:8080/user/update"
        return try await sendRequest(
            to: url,
            method: "POST",
            body: userUpdate,
            responseType: UserDTO.self
        )
    }
    
    // UserWeight
    func getLastUserWeight() async throws -> UserWeightDTO {
        let url = "http://127.0.0.1:8080/user-weights/last"
        return try await sendRequest(
            to: url,
            method: "GET",
            body: EmptyBody(),
            responseType: UserWeightDTO.self
        )
    }
    
    func getUserWeightsByPeriod(startDate: String, endDate: String) async throws -> [UserWeightDTO] {
        let url = "http://127.0.0.1:8080/user-weights/period?startDate=\(startDate)&endDate=\(endDate)"
        return try await sendRequest(
            to: url,
            method: "GET",
            body: EmptyBody(),
            responseType: [UserWeightDTO].self
        )
    }
    
    func getAllUserWeights() async throws -> [UserWeightDTO] {
        let url = "http://127.0.0.1:8080/user-weights"
        return try await sendRequest(
            to: url,
            method: "GET",
            body: EmptyBody(),
            responseType: [UserWeightDTO].self
        )
    }
    
    func createUserWeight(_ userWeight: UserWeightCreateRequestDTO) async throws -> UserWeightDTO {
        let url = "http://127.0.0.1:8080/user-weights"
        return try await sendRequest(
            to: url,
            method: "POST",
            body: userWeight,
            responseType: UserWeightDTO.self
        )
    }
    
    func updateUserWeight(id: UUID, with updatedWeight: UserWeightDTO) async throws -> UserWeightDTO {
        let url = "http://127.0.0.1:8080/user-weights/\(id.uuidString)"
        return try await sendRequest(
            to: url,
            method: "PUT",
            body: updatedWeight,
            responseType: UserWeightDTO.self
        )
    }
    
    func deleteUserWeight(id: UUID) async throws {
        let url = "http://127.0.0.1:8080/user-weights/\(id.uuidString)"
        _ = try await sendRequest(
            to: url,
            method: "DELETE",
            body: EmptyBody(),
            responseType: EmptyBody.self
        )
    }
    
    func handleServerError(data: Data) -> String {
        guard let serverMessage = try? JSONDecoder().decode(APIErrorDTO.self, from: data) else {
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
