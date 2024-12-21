//
//  WeightEditView.swift
//  ZakFit_front
//
//  Created by Aurélien on 13/12/2024.
//

import SwiftUI

struct WeightEditView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {  
            AppFieldWithEditDouble(
                label: "Poids actuel",
                value: $profileViewModel.lastUserWeight.weightValue,
                unit: "kg",
                onValueChanged: {
                    await profileViewModel.createUserWeight()
                }
            )
        }
    }
}
