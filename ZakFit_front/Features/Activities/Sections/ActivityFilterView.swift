//
//  ActivityFilterView.swift
//  ZakFit_front
//
//  Created by Aurélien on 05/01/2025.
//

import SwiftUI

struct ActivityFilterView: View {
    @State var selectedOption: String = "Course à pied"
    
    var body: some View {
        AppMenuPicker(
            label: "Filtrer par activité",
            options: [
                "Course à pied",
                "Marche rapide",
                "Natation",
                "Cyclisme",
                "Yoga",
                "Musculation",
                "Danse",
                "Tennis",
                "Ajouter une activité"
            ],
            selectedOption: $selectedOption
        )
    }
}

