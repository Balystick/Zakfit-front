//
//  DashboardViewModel.swift
//  ZakFit_front
//
//  Created by Aurélien on 30/12/2024.
//

import SwiftUI

class DashboardViewModel: ObservableObject, @unchecked Sendable {
    private let sharedViewModel: SharedViewModel

    let temp = ""
    @Published var errorMessage: String?
    
    // Données caloriques
    @Published var bmr: Double = 0
    @Published var tdee: Double = 0
    
    // Weight
    @Published var trackingPeriodOptions: [String] = ["7 jours", "Mois", "Année"]
    @Published var trackingPeriod: String = "7 jours"
    @Published var userWeights: [UserWeight] = []
    @Published var averageWeights: [(date: Date, average: Double)] = []
    
    init(sharedViewModel: SharedViewModel) {
        self.sharedViewModel = sharedViewModel
        }
    
    // Données caloriques
    func calculateBMR() {
        guard
            let birthDate = ISO8601DateFormatter().date(from: sharedViewModel.user.dateOfBirth),
            ["Homme", "Femme"].contains(sharedViewModel.user.sexe)
        else {
            self.bmr = 0
            print("Erreur dans calculateBMR : données manquantes")
            return
        }
        
        let age = calculateAge(from: birthDate)
        
        switch sharedViewModel.user.sexe {
        case "Homme":
            self.bmr = 10 * self.sharedViewModel.lastUserWeight.weightValue + 6.25 * sharedViewModel.user.height - 5 * Double(age) + 5
        case "Femme":
            self.bmr = 10 * self.sharedViewModel.lastUserWeight.weightValue + 6.25 * sharedViewModel.user.height - 5 * Double(age) - 161
        default:
            self.bmr = 0
        }
    }
    
    func calculateAge(from birthDate: Date) -> Int {
        let calendar = Calendar.current
        let now = Date()
        let ageComponents = calendar.dateComponents([.year], from: birthDate, to: now)
        return ageComponents.year ?? 0
    }
    
    func calculateTDEE() {
        let activityFactors: [String: Double] = [
            "Sédentaire": 1.2,
            "Légèrement actif": 1.375,
            "Actif": 1.55,
            "Très actif": 1.725
        ]
        
        guard
            bmr > 0,
            activityFactors.keys.contains(sharedViewModel.user.activityLevel)
        else {
            self.tdee = 0
            print("Erreur dans calculateTDEE : données manquantes")
            return
        }
        
        let factor = activityFactors[sharedViewModel.user.activityLevel]!
        self.tdee = bmr * factor
    }
    
    //Weight
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
    
    func calculatePeriodDates() -> (startDate: Date, endDate: Date) {
        let calendar = Calendar.current
        let now = Date()
        
        switch trackingPeriod {
        case "7 jours":
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
        
        switch trackingPeriod {
        case "7 jours":
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
}
