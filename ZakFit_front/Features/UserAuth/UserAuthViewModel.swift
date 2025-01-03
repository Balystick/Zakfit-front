//
//  UserAuthViewModel.swift
//  ZakFit_front
//
//  Created by Aurélien on 10/12/2024.
//

import SwiftUI

class UserAuthViewModel: ObservableObject, @unchecked Sendable {
    private let sharedViewModel: SharedViewModel
    @Published var email = ""
    @Published var password = ""
    @Published var errorAlert: ErrorAlert?
    
    init(sharedViewModel: SharedViewModel) {
        self.sharedViewModel = sharedViewModel
    }
    
    func login() async {
        guard validateInputs() else { return }

        do {
            let userAuthResponseDTO = try await APIManager.shared.loginUser(email: email, password: password)
            KeychainManager.saveTokenToKeychain(token: userAuthResponseDTO.token)
            
            DispatchQueue.main.async {
                self.sharedViewModel.isAuthenticated = true
                self.sharedViewModel.user = userAuthResponseDTO.user
                self.email = ""
                self.password = ""
            }
        } catch let APIRequestError.serverError(statusCode) {
            if let data = APIManager.shared.latestErrorResponseData,
               let serverError = try? JSONDecoder().decode(APIErrorDTO.self, from: data) {
                DispatchQueue.main.async {
                    self.errorAlert = ErrorAlert(message: serverError.reason)
                }
            } else {
                setError("Erreur serveur (\(statusCode)) : Une erreur est survenue.")
            }
        } catch {
            setError(error.localizedDescription)
        }
    }
    
    func registration() async {
        guard validateInputs() else { return }
        
        do {
            let userAuthResponseDTO = try await APIManager.shared.registerUser(email: email, password: password)
            KeychainManager.saveTokenToKeychain(token: userAuthResponseDTO.token)
            
            DispatchQueue.main.async {
                self.sharedViewModel.isAuthenticated = true
                self.sharedViewModel.user = userAuthResponseDTO.user
                self.email = ""
                self.password = ""
            }
        } catch let APIRequestError.serverError(statusCode) {
            if let data = APIManager.shared.latestErrorResponseData,
               let serverError = try? JSONDecoder().decode(APIErrorDTO.self, from: data) {
                DispatchQueue.main.async {
                    self.errorAlert = ErrorAlert(message: serverError.reason)
                }
            } else {
                setError("Erreur serveur (\(statusCode)) : Une erreur est survenue.")
            }
        } catch {
            setError(error.localizedDescription)
        }
    }
    
    private func validateInputs() -> Bool {
        var errors = [String]()
        
        if email.isEmpty {
            errors.append("L'adresse email est obligatoire.")
        } else if !isValidEmail(email) {
            errors.append("L'adresse email n'est pas valide.")
        }
        
        if password.isEmpty {
            errors.append("Le mot de passe est obligatoire.")
        }
        
        if !errors.isEmpty {
            setError(errors.joined(separator: "\n"))
            return false
        }
        
        return true
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private func setError(_ message: String) {
        DispatchQueue.main.async {
            self.errorAlert = ErrorAlert(message: message)
        }
    }
}
