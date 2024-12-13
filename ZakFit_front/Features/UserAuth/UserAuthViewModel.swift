//
//  UserAuthViewModel.swift
//  ZakFit_front
//
//  Created by Aurélien on 10/12/2024.
//
//

import Foundation

class UserAuthViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorAlert: ErrorAlert?
    
    func login(authViewModel: AuthViewModel) async {
        guard validateInputs() else { return }
        
        do {
            let userAuthRequest = UserAuthRequest(email: email, password: password)
            let userAuthResponse: UserAuthResponse = try await APIManager.shared.sendRequest(
                to: "http://127.0.0.1:8080/users/login",
                method: "POST",
                body: userAuthRequest,
                responseType: UserAuthResponse.self
            )

            KeychainManager.saveTokenToKeychain(token: userAuthResponse.token)
            DispatchQueue.main.async {
                authViewModel.isAuthenticated = true
                authViewModel.currentUser = userAuthResponse.user
            }
        } catch let APIRequestError.serverError(statusCode) {
            if let data = APIManager.shared.latestErrorResponseData {
                let errorMessage = APIManager.shared.handleServerError(data: data)
                setError(errorMessage)
            } else {
                setError("Erreur serveur (\(statusCode)) : Une erreur est survenue.")
            }
        } catch {
                setError(error.localizedDescription)
            }
        }
    
    func registration(authViewModel: AuthViewModel) async {
        guard validateInputs() else { return }
        
        do {
            let userAuthRequest = UserAuthRequest(email: email, password: password)
            let userAuthResponse: UserAuthResponse = try await APIManager.shared.sendRequest(
                to: "http://127.0.0.1:8080/users/create",
                method: "POST",
                body: userAuthRequest,
                responseType: UserAuthResponse.self
            )

            KeychainManager.saveTokenToKeychain(token: userAuthResponse.token)
            DispatchQueue.main.async {
                authViewModel.isAuthenticated = true
                authViewModel.currentUser = userAuthResponse.user
            }
        } catch let APIRequestError.serverError(statusCode) {
            if let data = APIManager.shared.latestErrorResponseData {
                let errorMessage = APIManager.shared.handleServerError(data: data)
                setError(errorMessage)
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