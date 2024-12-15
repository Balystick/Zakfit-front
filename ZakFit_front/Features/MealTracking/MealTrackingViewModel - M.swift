
//
//  MealTrackingViewModel.swift
//  ZakFit_front
//
//  Created by Aurélien on 14/12/2024.
//

import Foundation

class MealTrackingViewModel: ObservableObject {
    @Published var monitoringPeriod: String = "Aujourd'hui"
    let monitoringPeriodOptions = [
        "Aujourd'hui",
        "Semaine",
        "Mois"
    ]
    var foodIsCustom: Bool = true
    @Published var foodName: String = "Aliment"
    @Published var foodValue: Double = 100
    @Published var nutrientName: String = "Vitamine C"
    @Published var nutrientValue: Double = 100
    @Published var nutrientDescription = "Antioxydant essentiel qui renforce le système immunitaire, favorise l’absorption du fer et protège les cellules contre le stress oxydatif. Contribue également à la formation du collagène et au bon fonctionnement du métabolisme énergétique."
    @Published var foodDescription = "Aliment riche en nutriments essentiels, il fournit de l’énergie et contribue au bon fonctionnement de l’organisme. Source de vitamines, minéraux, protéines, glucides ou lipides selon sa nature, il joue un rôle clé dans une alimentation équilibrée."
    var nutrientIsCustom: Bool = true

}
