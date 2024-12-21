//
//  ActivityLevelView.swift
//  ZakFit_front
//
//  Created by Aurélien on 12/12/2024.
//

import SwiftUI

struct ActivityLevelView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        AppSegmentedPicker(
            label: "Période",
            options: profileViewModel.activityOptions,
            selection: $profileViewModel.user.activityLevel,
            onValueChanged: {
                await profileViewModel.saveUserChanges()
            }
        )
    }
}
