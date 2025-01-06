//
//  BMRInfoSheetView.swift
//  ZakFit_front
//
//  Created by Aurélien on 02/01/2025.
//

import SwiftUI

struct InfoSheetView: View {
    @Binding var isPresented: Bool
    @Binding var showInfoType: String
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    if showInfoType == "caloricData" {
                        Text("Comprendre votre **dépense calorique**")
                            .font(.headline)
                            .padding(.bottom, 10)
                        
                        Text("Le **BMR** (Basal Metabolic Rate) représente la quantité minimale de calories que votre corps consomme au repos pour maintenir ses fonctions vitales.")
                            .padding(.bottom, 5)

                        Text("Ces fonctions vitales incluent :")
                        VStack(alignment: .leading, spacing: 5) {
                            Text("• La respiration")
                            Text("• La circulation sanguine")
                            Text("• La régulation de la température corporelle")
                            Text("• La digestion et l’élimination des déchets")
                        }
                        .padding(.bottom, 10)

                        Text("Le **TDEE (Total Daily Energy Expenditure)** correspond au nombre total de calories que votre corps dépense chaque jour.")
                            .padding(.bottom, 5)

                        Text("Le TDEE est calculé en prenant en compte le BMR, mais également votre niveau d'activité physique :")
                        VStack(alignment: .leading, spacing: 5) {
                            Text("• **Sédentaire** : peu ou pas d'exercice")
                            Text("• **Légèrement actif** : exercices légers 1 à 3 jours par semaine")
                            Text("• **Actif** : exercices modérés 3 à 5 jours par semaine")
                            Text("• **Très actif** : exercices intenses 6 à 7 jours par semaine")
                        }
                        .padding(.bottom, 10)
                    }
                    
                    if showInfoType == "nutritionalBalance" {
                        Text("Votre **équilibre nutritionnel** repose sur trois macronutriments essentiels :")
                            .font(.headline)
                            .padding(.bottom, 10)

                        Text("1. **Protéines**")
                            .foregroundColor(.purple)
                            .padding(.bottom, 5)

                        Text("Les **protéines** jouent un rôle crucial dans la construction et la réparation des tissus musculaires, ainsi que dans le fonctionnement du système immunitaire.")
                        Text("Elles doivent représenter une part significative de votre apport calorique quotidien, particulièrement si vous êtes actif ou en phase de récupération après un effort physique.")
                            .padding(.bottom, 10)

                        Text("2. **Glucides**")
                            .foregroundColor(.yellow)
                            .padding(.bottom, 5)

                        Text("Les **glucides** constituent la principale source d'énergie pour le corps, en particulier pour l'activité physique et le fonctionnement cérébral.")
                        Text("Ils doivent être adaptés à votre niveau d'activité, en privilégiant des sources complètes et riches en fibres.")
                            .padding(.bottom, 10)
                        
                        Text("3. **Lipides**")
                            .foregroundColor(.red)
                            .padding(.bottom, 5)

                        Text("Les **lipides** sont une source d'énergie importante et sont essentiels pour l'absorption de certaines vitamines, ainsi que pour le fonctionnement hormonal.")
                        Text("Cependant, ils doivent être consommés en quantité modérée pour éviter un déséquilibre calorique.")
                            .padding(.bottom, 10)
                        
                        Text("Un **équilibre nutritionnel optimal** signifie répartir vos apports caloriques entre ces trois macronutriments selon vos besoins personnels et vos objectifs :")
                        VStack(alignment: .leading, spacing: 5) {
                            Text("• **Perte de poids** : réduire les glucides ou les lipides tout en maintenant un apport en protéines suffisant")
                            Text("• **Maintien du poids** : équilibrer les apports entre protéines, lipides et glucides")
                            Text("• **Prise de masse** : augmenter les glucides et les protéines pour répondre à une demande énergétique accrue")
                        }
                        .padding(.bottom, 10)

                        Text("Suivre votre équilibre nutritionnel vous permet de mieux comprendre votre alimentation et d'optimiser votre santé et vos performances.")
                    }

                    
                    if showInfoType == "energyBalance" {
                        Text("Votre **bilan énergétique** repose sur deux éléments essentiels :")
                            .font(.headline)
                            .padding(.bottom, 10)
                        
                        Text("1. **Énergie consommée**")
                            .foregroundColor(.green)
                            .padding(.bottom, 5)
                        
                        Text("L'énergie consommée correspond à la quantité totale de calories que vous avez ingérées à travers vos repas et boissons au cours de la journée.")
                            .padding(.bottom, 10)
                        
                        Text("Les objectifs caloriques journaliers sont à ajuster en fonction de vos besoins :")
                        VStack(alignment: .leading, spacing: 5) {
                            Text("• **Perte de poids** : consommer moins que le TDEE")
                            Text("• **Maintien du poids** : consommer environ l'équivalent du TDEE")
                            Text("• **Prise de masse** : consommer plus que le TDEE")
                        }
                        .padding(.bottom, 10)
                        
                        Text("2. **Énergie dépensée**")
                            .foregroundColor(.blue)
                            .padding(.bottom, 5)
                        
                        Text("L'énergie dépensée représente le total des calories brûlées par votre corps au cours de la journée.")
                        Text("Elle inclut :")
                        VStack(alignment: .leading, spacing: 5) {
                            Text("• Les calories brûlées par vos activités physiques")
                            Text("• Votre métabolisme basal (BMR), qui correspond à l'énergie consommée pour maintenir vos fonctions vitales")
                            Text("• La digestion et l'absorption des nutriments")
                            Text("• Votre activité générale au quotidien (marcher, bouger, etc.)")
                        }
                        .padding(.bottom, 10)
                        
                        Text("Suivre à la fois votre énergie consommée et votre énergie dépensée vous aide à mieux comprendre votre bilan énergétique et à ajuster vos habitudes pour atteindre vos objectifs.")
                    }
                    
                    
                    Spacer()
                }
                .padding()
            }
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
