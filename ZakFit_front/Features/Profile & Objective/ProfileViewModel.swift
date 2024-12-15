//
//  ProfileViewModel.swift
//  ZakFit_front
//
//  Created by Aurélien on 12/12/2024.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var isProfileLoaded: Bool = false
    // PersonalInfos
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var sexe: String = "Homme"
    let sexeOptions = [ "Homme", "Femme" ]
    @Published var dateOfBirth: Date? = nil
    @Published var height: Float? = nil
    @Published var weight: Float = 75.0
    
    // Notifications
    @Published var isReminderEnabled: Bool = true
    @Published var selectedRecurrence: String = "Jamais"
    
    let recurrenceOptions = [
        "Jamais",
        "Tous les jours",
        "Toutes les semaines",
        "Toutes les 2 semaines",
        "Tous les mois",
        "Tous les ans",
        "Personnalisée"
    ]
    
    // ActivityLevel
    @Published var activityLevel: String = "Modéré"
    let activityOptions = [
        "Sédentaire",
        "Modéré",
        "Actif",
        "Très actif"
    ]
    
    //Energie Consumption
    
    func loadProfile() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if !self.isProfileLoaded {
                self.firstName = "Jean"
                self.lastName = "Dupont"
                self.email = "jean.dupont@example.com"
                self.sexe = "Homme"
                self.weight = 75.0
                self.activityLevel = "Modéré"
                self.isProfileLoaded = true
            }
        }
    }
    
    func saveProfile() {
        print("Sauvegarde des données :")
        print("Nom : \(firstName) \(lastName), Email : \(email), Poids : \(weight)")
    }
}
