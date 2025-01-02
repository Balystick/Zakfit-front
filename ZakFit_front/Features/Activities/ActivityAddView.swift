//
//  ActivityAddView.swift
//  ZakFit_front
//
//  Created by Aurélien on 30/12/2024.
//

import SwiftUI

struct ActivityAddView: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AppSection(title: "Type de l'activité") {
                    ActivityTypeView()
                }
                AppSection(title: "Date et heure") {
                    ActivityDateTimeView()
                }
                AppSection(title: "Intensité") {
                    ActivityIntensityView()
                }
                AppSection(title: "Dépense énergétique") {
                    ActivityEnergyBurnedView()
                }
                AppSection(title: "Notes pour l'activité type") {
                    ActivityTypeNotesView()
                }
                AppSection(title: "Notes pour cette activité") {
                    ActivityNotesView()
                }
            }
        }
    }
}

#Preview {
    ActivityAddView()
}
