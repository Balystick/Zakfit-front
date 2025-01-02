//
//  BMRInfoSheetView.swift
//  ZakFit_front
//
//  Created by Aurélien on 02/01/2025.
//

import SwiftUI

struct BMRInfoSheetView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Le **BMR (Basal Metabolic Rate)** est la quantité minimale de calories que votre corps consomme au repos pour maintenir vos fonctions vitales.")
                
                Text("Les fonctions vitales incluent la respiration, la circulation sanguine, la régulation de la température corporelle, la digestion et l’élimination des déchets.")
                    .padding(.bottom, 10)
                
                Text("Le **TDEE (Total Daily Energy Expenditure)** représente le nombre total de calories que votre corps consomme par jour")
                
                Text("Le TDEE inclut le BMR et varie selon votre niveau d'activité :")
                VStack(alignment: .leading, spacing: 5) {
                    Text("• Sédentaire : peu ou pas d'exercice")
                    Text("• Légèrement actif : exercices légers 1 à 3 jours par semaine")
                    Text("• Actif : exercices modérés 3 à 5 jours par semaine")
                    Text("• Très actif : exercices intenses 6 à 7 jours par semaine")
                }
                .padding(.bottom, 10)

                Spacer()
            }
            .padding()
            .navigationTitle("À propos du BMR")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Fermer") {
                        isPresented = false
                    }
                }
            }
        }
    }
}
