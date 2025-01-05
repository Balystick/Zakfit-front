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
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIRequestError.invalidResponse
            }
            
            latestErrorResponseData = data
            
            switch httpResponse.statusCode {
            case 200...299:
                
                if httpResponse.statusCode == 204 {
                    if responseType == EmptyBody.self {
                        return EmptyBody() as! T
                    } else {
                        throw APIRequestError.decodingFailed
                    }
                }
                
                if data.isEmpty, responseType == EmptyBody.self {
                    return EmptyBody() as! T
                }
                
                do {
                    let decodedData = try JSONDecoder().decode(responseType, from: data)
                    return decodedData
                } catch {
                    throw APIRequestError.decodingFailed
                }
                
            default:
                throw APIRequestError.serverError(statusCode: httpResponse.statusCode)
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
    
    // Update Password
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
    
    // Goals
    func getAllGoals() async throws -> [GoalDTO] {
        let url = "http://127.0.0.1:8080/goals"
        return try await sendRequest(
            to: url,
            method: "GET",
            body: EmptyBody(),
            responseType: [GoalDTO].self
        )
    }
    
    func createGoal(_ createGoalRequest: CreateGoalRequestDTO) async throws -> GoalDTO {
        let url = "http://127.0.0.1:8080/goals"
        return try await sendRequest(
            to: url,
            method: "POST",
            body: createGoalRequest,
            responseType: GoalDTO.self
        )
    }
    
    func updateGoal(goalId: UUID, updateGoalRequest: UpdateGoalRequestDTO) async throws -> GoalDTO {
        let url = "http://127.0.0.1:8080/goals/\(goalId)"
        return try await sendRequest(
            to: url,
            method: "PUT",
            body: updateGoalRequest,
            responseType: GoalDTO.self
        )
    }
    
    func deleteGoal(goalId: UUID) async throws {
        let url = "http://127.0.0.1:8080/goals/\(goalId)"
        _ = try await sendRequest(
            to: url,
            method: "DELETE",
            body: EmptyBody(),
            responseType: EmptyBody.self
        )
    }
    
    func getGoalTypes() async throws -> [GoalTypeDTO] {
        let url = "http://127.0.0.1:8080/goals/types"
        return try await sendRequest(
            to: url,
            method: "GET",
            body: EmptyBody(),
            responseType: [GoalTypeDTO].self
        )
    }
    
    // Activity
    
    func getActivityTypes() async throws -> [ActivityTypeDTO] {
        let url = "http://127.0.0.1:8080/activities/types"
        return try await sendRequest(
            to: url,
            method: "GET",
            body: EmptyBody(),
            responseType: [ActivityTypeDTO].self
        )
    }
}
