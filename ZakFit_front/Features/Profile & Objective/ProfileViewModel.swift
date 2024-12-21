//
//  ProfileViewModel.swift
//  ZakFit_front
//
//  Created by Aurélien on 12/12/2024.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    private let authViewModel: AuthViewModel
    @Published var user: User = User()
    @Published var tmp: Double = 0
    @Published var errorMessage: String?

    let activityOptions = [
        "Sédentaire",
        "Modéré",
        "Actif",
        "Très actif"
    ]
    let sexeOptions = [ "Homme", "Femme", "Non renseigné" ]
    
        init(authViewModel: AuthViewModel) {
            self.authViewModel = authViewModel
            updateUserFromAuth()
            Task {
                await fetchLastUserWeight()
            }
        }
    
    func updateUserFromAuth() {
        guard let currentUser = authViewModel.currentUser else {
            print("Erreur : currentUser est nil dans authViewModel")
            return
        }
        self.user.firstName = currentUser.firstName
        self.user.lastName = currentUser.lastName
        self.user.email = currentUser.email
        self.user.dateOfBirth = currentUser.dateOfBirth
        self.user.height = currentUser.height
        self.user.sexe = currentUser.sexe
        self.user.activityLevel = currentUser.activityLevel
    }
    
    func saveUserChanges() async {
        do {
            let userUpdate = User(
                firstName: user.firstName,
                lastName: user.lastName,
                email: user.email,
                dateOfBirth: user.dateOfBirth,
                height: user.height,
                sexe: user.sexe,
                activityLevel: user.activityLevel
            )

            let updatedUserDTO = try await APIManager.shared.updateUser(userUpdate)

            DispatchQueue.main.async {
                self.user = updatedUserDTO.toModel()
                self.authViewModel.currentUser = self.user
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Une erreur est survenue : \(error.localizedDescription)"
            }
        }
    }

    // Poids
    @Published var weightPeriodOptions: [String] = ["Semaine", "Mois", "Année"]
    @Published var weightPeriod: String = "Semaine"
    @Published var lastUserWeight: UserWeight = UserWeight()
    @Published var userWeights: [UserWeight] = []
    @Published var averageWeights: [(date: Date, average: Double)] = []

    func fetchLastUserWeight() async {
        do {
            let responseDTO = try await APIManager.shared.getLastUserWeight()
            
            let userWeight = responseDTO.toModel()
            
            DispatchQueue.main.async {
                self.lastUserWeight = userWeight
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Erreur : \(error.localizedDescription)"
            }
        }
    }
    
    func fetchUserWeightsByPeriod() async {
        let (startDate, endDate) = calculatePeriodDates()
        do {
            let isoFormatter = ISO8601DateFormatter()
            let startDateString = isoFormatter.string(from: startDate)
            let endDateString = isoFormatter.string(from: endDate)
            
            let responseDTOs = try await APIManager.shared.getUserWeightsByPeriod(
                startDate: startDateString,
                endDate: endDateString
            )
            
            let sortedWeights = responseDTOs.map { $0.toModel() }
                .sorted { $0.dateTime > $1.dateTime }
            
            DispatchQueue.main.async {
                self.userWeights = sortedWeights
                self.averageWeights = self.calculateAverages()
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Erreur : \(error.localizedDescription)"
            }
        }
    }
    
    func createUserWeight() async {
        do {
            let weightValue = lastUserWeight.weightValue

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
                self.lastUserWeight = createdWeight
                self.userWeights.append(createdWeight)
                self.userWeights.sort { $0.dateTime > $1.dateTime }
                self.averageWeights = self.calculateAverages()
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Erreur : \(error.localizedDescription)"
            }
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
                        self.lastUserWeight = mostRecentWeight
                    }
                    self.averageWeights = self.calculateAverages()
                }
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Erreur : \(error.localizedDescription)"
            }
        }
    }
    
    func deleteUserWeight(id: UUID) async {
        do {
            try await APIManager.shared.deleteUserWeight(id: id)
            
            DispatchQueue.main.async {
                self.userWeights.removeAll { $0.id == id }
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Erreur : \(error.localizedDescription)"
            }
        }
    }
    
    func calculatePeriodDates() -> (startDate: Date, endDate: Date) {
        let calendar = Calendar.current
        let now = Date()
        
        switch weightPeriod {
        case "Semaine":
            let startDate = calendar.date(byAdding: .day, value: -7, to: now) ?? now
            return (startDate, now)
        case "Mois":
            let startDate = calendar.date(byAdding: .month, value: -1, to: now) ?? now
            return (startDate, now)
        case "Année":
            let startDate = calendar.date(byAdding: .year, value: -1, to: now) ?? now
            return (startDate, now)
        default:
            return (now, now)
        }
    }
    
    func groupWeightsByPeriod() -> [[UserWeight]] {
        let calendar = Calendar.current
        var groupedWeights: [[UserWeight]] = []

        switch weightPeriod {
        case "Semaine":
            groupedWeights = Dictionary(grouping: userWeights) { weight in
                let date = ISO8601DateFormatter().date(from: weight.dateTime) ?? Date()
                return calendar.startOfDay(for: date)
            }
            .values.map { $0.sorted { $0.dateTime < $1.dateTime } }

        case "Mois":
            let interval = 4
            groupedWeights = Dictionary(grouping: userWeights) { weight in
                let date = ISO8601DateFormatter().date(from: weight.dateTime) ?? Date()
                let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: date)) ?? Date()
                let daysSinceStart = calendar.dateComponents([.day], from: startOfMonth, to: date).day ?? 0
                let intervalStart = daysSinceStart / interval * interval
                return calendar.date(byAdding: .day, value: intervalStart, to: startOfMonth) ?? Date()
            }
            .values.map { $0.sorted { $0.dateTime < $1.dateTime } }

        case "Année":
            groupedWeights = Dictionary(grouping: userWeights) { weight in
                let date = ISO8601DateFormatter().date(from: weight.dateTime) ?? Date()
                let month = calendar.component(.month, from: date)
                return calendar.date(from: DateComponents(year: calendar.component(.year, from: date), month: month, day: 1)) ?? Date()
            }
            .values.map { $0.sorted { $0.dateTime < $1.dateTime } }

        default:
            groupedWeights = []
        }

        return groupedWeights.sorted { group1, group2 in
            guard let firstDate1 = group1.first?.dateTime,
                  let firstDate2 = group2.first?.dateTime else { return false }
            return firstDate1 < firstDate2
        }
    }
    
    func calculateAverages() -> [(date: Date, average: Double)] {
        let groupedWeights = groupWeightsByPeriod()
        let isoFormatter = ISO8601DateFormatter()

        return groupedWeights.compactMap { group in
            guard let firstDate = group.first?.dateTime,
                  let date = isoFormatter.date(from: firstDate) else {
                return nil
            }
            let averageWeight = group.map { $0.weightValue }.reduce(0, +) / Double(group.count)

            return (date: date, average: averageWeight)
        }
    }
    
    // À déplacer dans un sharedViewModel ?
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
}
