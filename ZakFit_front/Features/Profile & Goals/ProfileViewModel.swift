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
    
    // Goals
    @Published var goals: [Goal] = []
    @Published var goalTypes: [GoalType] = []
    @Published var activityTypes: [ActivityType] = []
    
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
    
    // Goals
    func fetchAllGoals() async {
        do {
            let responseDTOs = try await APIManager.shared.getAllGoals()
            DispatchQueue.main.async {
                self.goals = responseDTOs.map { $0.toModel() }
                    .sorted { $0.priority < $1.priority }
            }
        } catch {
            print("Erreur dans fetchAllGoals : \(error.localizedDescription)")
        }
    }
    
    func createGoal(_ createGoalRequest: CreateGoalRequestDTO) async {
        do {
            let createdGoalDTO = try await APIManager.shared.createGoal(createGoalRequest)
            DispatchQueue.main.async {
                let createdGoal = createdGoalDTO.toModel()
                self.goals.append(createdGoal)
                self.goals.sort { $0.priority < $1.priority }
            }
        } catch {
            print("Erreur dans createGoal : \(error.localizedDescription)")
        }
    }
    
    func updateGoal(goalId: UUID, with updateGoalRequest: UpdateGoalRequestDTO) async {
        do {
            let updatedGoalDTO = try await APIManager.shared.updateGoal(goalId: goalId, updateGoalRequest: updateGoalRequest)
            DispatchQueue.main.async {
                if let index = self.goals.firstIndex(where: { $0.id == goalId }) {
                    self.goals[index] = updatedGoalDTO.toModel()
                    self.goals.sort { $0.priority < $1.priority }
                }
            }
        } catch {
            print("Erreur dans updateGoal : \(error.localizedDescription)")
        }
    }
    
    func deleteGoal(goalId: UUID) async {
        do {
            try await APIManager.shared.deleteGoal(goalId: goalId)
            DispatchQueue.main.async {
                self.goals.removeAll { $0.id == goalId }
            }
        } catch {
            print("Erreur dans deleteGoal : \(error.localizedDescription)")
        }
    }
    
    func fetchGoalTypes() async {
        do {
            let goalTypesDTO = try await APIManager.shared.getGoalTypes()
            DispatchQueue.main.async {
                self.goalTypes = goalTypesDTO
                    .map { $0.toModel() }
                    .sorted { $0.order < $1.order }
            }
        } catch {
            print("Erreur dans fetchGoalTypes : \(error.localizedDescription)")
        }
    }
    
    func fetchActivityTypes() async {
        do {
            let activityTypesDTO = try await APIManager.shared.getActivityTypes()
            DispatchQueue.main.async {
                self.activityTypes = activityTypesDTO.map { $0.toModel() }
            }
        } catch {
            print("Erreur dans fetchActivityTypes : \(error.localizedDescription)")
        }
    }
    
    func getGoalTypeNames(forCategory categoryName: String) -> [String] {
        return self.goalTypes
            .filter { $0.categoryName == categoryName }
            .map { $0.name }
    }
    
    func loadGoalsTargetValues() {
        if let weightGoal = goals.first(where: { $0.goalType.categoryName == "Objectifs de poids" }) {
            sharedViewModel.userWeightGoalTargetValue = weightGoal.targetValue
        }
        if let consumedCaloriesGoal = goals.first(where: { $0.goalType.name == "Calories par jour (consommation)" }) {
            sharedViewModel.consumedCaloriesGoalTargetValue = consumedCaloriesGoal.targetValue
        }
        if let burnedCaloriesGoal = goals.first(where: { $0.goalType.name == "Calories par jour (dépense)" }) {
            sharedViewModel.burnedCaloriesGoalTargetValue = burnedCaloriesGoal.targetValue
        }
    }
    
    func createOrUpdateWeightGoal(targetValue: Double) async {
        if let existingGoal = goals.first(where: { $0.goalType.name == "Poids cible" }) {
            let updateRequest = UpdateGoalRequestDTO(
                goalTypeId: existingGoal.goalType.id,
                goalStatus: existingGoal.goalStatus,
                goalUnit: existingGoal.goalUnit,
                relatedActivityTypeId: existingGoal.relatedActivityType?.id,
                relatedNutrientId: existingGoal.relatedNutrientId,
                targetValue: targetValue,
                minValue: existingGoal.minValue,
                maxValue: existingGoal.maxValue,
                frequency: existingGoal.frequency,
                startDate: existingGoal.startDate,
                endDate: existingGoal.endDate,
                priority: existingGoal.priority,
                description: existingGoal.description
            )
            await updateGoal(goalId: existingGoal.id, with: updateRequest)
        } else {
            guard let goalTypeId = getGoalTypeId(forName: "Poids cible") else {
                print("Erreur : Impossible de trouver le type d'objectif 'Poids cible'")
                return
            }

            let createRequest = CreateGoalRequestDTO(
                goalTypeId: goalTypeId,
                goalStatus: "Actif",
                goalUnit: "kg",
                relatedActivityTypeId: nil,
                relatedNutrientId: nil,
                targetValue: targetValue,
                minValue: nil,
                maxValue: nil,
                frequency: nil,
                startDate: formatDateForRequest(Date()),
                endDate: nil,
                priority: 1,
                description: nil
            )
            await createGoal(createRequest)
        }
    }
    
    func createOrUpdateConsumedCaloriesGoal(targetValue: Double) async {
        if let existingGoal = goals.first(where: { $0.goalType.name == "Calories par jour (consommation)" }) {
            let updateRequest = UpdateGoalRequestDTO(
                goalTypeId: existingGoal.goalType.id,
                goalStatus: existingGoal.goalStatus,
                goalUnit: existingGoal.goalUnit,
                relatedActivityTypeId: existingGoal.relatedActivityType?.id,
                relatedNutrientId: existingGoal.relatedNutrientId,
                targetValue: targetValue,
                minValue: existingGoal.minValue,
                maxValue: existingGoal.maxValue,
                frequency: existingGoal.frequency,
                startDate: existingGoal.startDate,
                endDate: existingGoal.endDate,
                priority: existingGoal.priority,
                description: existingGoal.description
            )
            await updateGoal(goalId: existingGoal.id, with: updateRequest)
        } else {
            guard let goalTypeId = getGoalTypeId(forName: "Calories par jour (consommation)") else {
                print("Erreur : Impossible de trouver le type d'objectif 'Poids cible'")
                return
            }

            let createRequest = CreateGoalRequestDTO(
                goalTypeId: goalTypeId,
                goalStatus: "Actif",
                goalUnit: "kcal",
                relatedActivityTypeId: nil,
                relatedNutrientId: nil,
                targetValue: targetValue,
                minValue: nil,
                maxValue: nil,
                frequency: nil,
                startDate: formatDateForRequest(Date()),
                endDate: nil,
                priority: 1,
                description: nil
            )
            await createGoal(createRequest)
        }
    }

    func createOrUpdateBurnedCaloriesGoal(targetValue: Double) async {
        if let existingGoal = goals.first(where: { $0.goalType.name == "Calories par jour (dépense)" }) {
            let updateRequest = UpdateGoalRequestDTO(
                goalTypeId: existingGoal.goalType.id,
                goalStatus: existingGoal.goalStatus,
                goalUnit: existingGoal.goalUnit,
                relatedActivityTypeId: existingGoal.relatedActivityType?.id,
                relatedNutrientId: existingGoal.relatedNutrientId,
                targetValue: targetValue,
                minValue: existingGoal.minValue,
                maxValue: existingGoal.maxValue,
                frequency: existingGoal.frequency,
                startDate: existingGoal.startDate,
                endDate: existingGoal.endDate,
                priority: existingGoal.priority,
                description: existingGoal.description
            )
            await updateGoal(goalId: existingGoal.id, with: updateRequest)
        } else {
            guard let goalTypeId = getGoalTypeId(forName: "Calories par jour (dépense)") else {
                print("Erreur : Impossible de trouver le type d'objectif 'Poids cible'")
                return
            }

            let createRequest = CreateGoalRequestDTO(
                goalTypeId: goalTypeId,
                goalStatus: "Actif",
                goalUnit: "kcal",
                relatedActivityTypeId: nil,
                relatedNutrientId: nil,
                targetValue: targetValue,
                minValue: nil,
                maxValue: nil,
                frequency: nil,
                startDate: formatDateForRequest(Date()),
                endDate: nil,
                priority: 1,
                description: nil
            )
            await createGoal(createRequest)
        }
    }

    
    func getGoalTypeId(forName name: String) -> UUID? {
        return goalTypes.first(where: { $0.name == name })?.id
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
    
    func formatDateForRequest(_ date: Date) -> String {
        let isoFormatter = ISO8601DateFormatter()
        return isoFormatter.string(from: date)
    }
    
    private func setError(_ message: String) {
        DispatchQueue.main.async {
            self.errorAlert = ErrorAlert(message: message)
        }
    }
}
