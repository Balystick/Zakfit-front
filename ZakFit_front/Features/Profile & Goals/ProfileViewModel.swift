//
//  ProfileViewModel.swift
//  ZakFit_front
//
//  Created by Aurélien on 12/12/2024.
//

import SwiftUI

class ProfileViewModel: ObservableObject, @unchecked Sendable {
    private let sharedViewModel: SharedViewModel
    @Published var successMessage: String? = nil
    @Published var errorAlert: ErrorAlert?
    
    // tmp
    @Published var tmp: Double = 0
    
    let activityOptions = [
        "Sédentaire",
        "Modéré",
        "Actif",
        "Très actif"
    ]

    let sexeOptions = [ "Homme", "Femme", "Non renseigné" ]

    // Notifications
    @Published var isReminderEnabled: Bool = true
    @Published var selectedRecurrence: String = "Jamais"
    let recurrenceOptions = [
        "Jamais",
        "Tous les jours",
        "Toutes les semaines",
        "Toutes les 2 semaines",
        "Tous les mois"
    ]

    // UpdatePassword
    @Published var oldPassword: String = ""
    @Published var newPassword: String = ""
    @Published var confirmNewPassword: String = ""
    
    // Weight
    @Published var userWeights: [UserWeight] = []
    
    init(sharedViewModel: SharedViewModel) {
        self.sharedViewModel = sharedViewModel
        Task {
            await self.fetchLastUserWeight()
        }
    }
    
    func logout() {
        KeychainManager.deleteTokenFromKeychain()
        self.sharedViewModel.isAuthenticated = false
    }
    
    func saveUserChanges() async {
        guard sharedViewModel.isAuthenticated else {
            print("Modification ignorée : utilisateur non authentifié")
            return
        }
        do {
            let updatedUserDTO = try await APIManager.shared.updateUser(sharedViewModel.user)
            
            DispatchQueue.main.async {
                self.sharedViewModel.user = updatedUserDTO.toModel()
            }
        } catch {
            print("Erreur dans saveUserChanges : \(error.localizedDescription)")
        }
    }
    
    func updatePassword() async {
        do {
            try await APIManager.shared.updatePassword(
                oldPassword: self.oldPassword,
                newPassword: self.newPassword,
                confirmPassword: self.confirmNewPassword
            )
            
            DispatchQueue.main.async {
                self.oldPassword = ""
                self.newPassword = ""
                self.confirmNewPassword = ""
                self.successMessage = "Votre mot de passe a été mis à jour avec succès."
                self.errorAlert = nil
            }
        } catch let APIRequestError.serverError(statusCode) {
            if let data = APIManager.shared.latestErrorResponseData,
               let serverError = try? JSONDecoder().decode(APIErrorDTO.self, from: data) {
                setError(serverError.reason)
            } else {
                setError("Erreur serveur (\(statusCode)) : Une erreur est survenue.")
            }
        } catch {
            setError("Une erreur inattendue est survenue. Veuillez réessayer.")
        }
    }
    
    // Weight
    func fetchLastUserWeight() async {
        do {
            let responseDTO = try await APIManager.shared.getLastUserWeight()
            
            let userWeight = responseDTO.toModel()
            
            DispatchQueue.main.async {
                self.sharedViewModel.lastUserWeight.weightValue = userWeight.weightValue
            }
        } catch {
            print("Erreur dans fetchLastUserWeight : \(error.localizedDescription)")
        }
    }
    
    func fetchAllUserWeights() async {
        do {
            let responseDTO = try await APIManager.shared.getAllUserWeights()
            
            DispatchQueue.main.async {
                self.userWeights = responseDTO.map { $0.toModel() }
                    .sorted { $0.dateTime > $1.dateTime }
            }
        } catch {
            print("Erreur dans fetchAllUserWeights : \(error.localizedDescription)")
        }
    }
    
    func createUserWeight() async {
        do {
            let weightValue = self.sharedViewModel.lastUserWeight.weightValue
            
            let dateTime = Date()
            let isoFormatter = ISO8601DateFormatter()
            let dateTimeString = isoFormatter.string(from: dateTime)
            
            let requestDTO = UserWeightCreateRequestDTO(
                dateTime: dateTimeString,
                weightValue: weightValue
            )
            
            let responseDTO = try await APIManager.shared.createUserWeight(requestDTO)
            
            let createdWeight = responseDTO.toModel()
            
            DispatchQueue.main.async {
                self.sharedViewModel.lastUserWeight = createdWeight
                self.userWeights.append(createdWeight)
                self.userWeights.sort { $0.dateTime > $1.dateTime }
            }
        } catch {
            print("Erreur dans createUserWeight : \(error.localizedDescription)")
            
        }
    }
    
    func updateUserWeight(id: UUID, dateTime: Date, weightValue: Double) async {
        do {
            let isoFormatter = ISO8601DateFormatter()
            let dateTimeString = isoFormatter.string(from: dateTime)
            
            let updatedWeightDTO = UserWeightDTO(
                id: id,
                dateTime: dateTimeString,
                weightValue: weightValue
            )
            
            let responseDTO = try await APIManager.shared.updateUserWeight(id: id, with: updatedWeightDTO)
            
            let updatedWeight = responseDTO.toModel()
            
            DispatchQueue.main.async {
                if let index = self.userWeights.firstIndex(where: { $0.id == id }) {
                    self.userWeights[index] = updatedWeight
                    self.userWeights.sort { $0.dateTime > $1.dateTime }
                    if let mostRecentWeight = self.userWeights.first, mostRecentWeight.id == id {
                        self.sharedViewModel.lastUserWeight = mostRecentWeight
                    }
                }
            }
        } catch {
            print("Erreur dans updateUserWeight : \(error.localizedDescription)")
        }
    }
    
    func deleteUserWeight(id: UUID) async {
        do {
            try await APIManager.shared.deleteUserWeight(id: id)
            
            DispatchQueue.main.async {
                self.userWeights.removeAll { $0.id == id }
            }
            await self.fetchLastUserWeight()
        } catch {
            print("Erreur dans deleteUserWeight : \(error.localizedDescription)")
        }
    }
    
    // Move to sharedViewModel ?
    func formatDate(_ isoDateString: String) -> String {
        let isoFormatter = ISO8601DateFormatter()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy HH:mm"
        dateFormatter.locale = Locale(identifier: "fr_FR")
        
        if let date = isoFormatter.date(from: isoDateString) {
            return dateFormatter.string(from: date)
        }
        return "Date invalide"
    }
    
    private func setError(_ message: String) {
        DispatchQueue.main.async {
            self.errorAlert = ErrorAlert(message: message)
        }
    }
}
