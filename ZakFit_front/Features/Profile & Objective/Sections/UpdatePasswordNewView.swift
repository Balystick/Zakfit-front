//
//  UpdatePasswordNewView.swift
//  ZakFit_front
//
//  Created by Aurélien on 21/12/2024.
//

import SwiftUI

struct UpdatePasswordNewView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AppSecureFieldWithEditString(
                label: "Mot de passe",
                value: $profileViewModel.newPassword
            )
            Divider()
            AppSecureFieldWithEditString(
                label: "Confirmation",
                value: $profileViewModel.confirmNewPassword
            )
        }
    }
}

