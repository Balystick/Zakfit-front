//
//  ActivityLevelView.swift
//  ZakFit_front
//
//  Created by Aurélien on 12/12/2024.
//

import SwiftUI

struct ActivityLevelView: View {
    @EnvironmentObject var sharedViewModel: SharedViewModel
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        AppSegmentedPicker(
            options: profileViewModel.activityOptions,
            selection: $sharedViewModel.user.activityLevel,
            onValueChanged: {
                await profileViewModel.saveUserChanges()
            }
        )
    }
}
