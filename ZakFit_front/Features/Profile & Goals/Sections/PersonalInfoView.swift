//
//  PersonalInfoView.swift
//  ZakFit_front
//
//  Created by Aurélien on 12/12/2024.
//

import SwiftUI

struct PersonalInfoView: View {
    @EnvironmentObject var sharedViewModel: SharedViewModel
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AppFieldWithEditString(
                label: "Prénom",
                value: $sharedViewModel.user.firstName,
                unit: "",
                onValueChanged: {
                    await profileViewModel.saveUserChanges()
                }
            )
            Divider()
            AppFieldWithEditString(
                label: "Nom",
                value: $sharedViewModel.user.lastName,
                unit: "",
                onValueChanged: {
                    await profileViewModel.saveUserChanges()
                }
            )
            Divider()
            AppFieldWithEditString(
                label: "Email",
                value: $sharedViewModel.user.email,
                unit: "",
                onValueChanged: {
                    await profileViewModel.saveUserChanges()
                }
            )
            Divider()
            AppFieldWithLink(
                label: "Mot de passe",
                value: "Modifier",
                destination: {
                    UpdatePasswordView()
                }
            )
            Divider()
            AppMenuPicker(
                label: "Sexe",
                options: profileViewModel.sexeOptions,
                selectedOption: $sharedViewModel.user.sexe,
                onValueChanged: {
                    await profileViewModel.saveUserChanges()
                }
            )
            Divider()
            AppDatePicker(
                label: "Date de naissance",
                dateString: $sharedViewModel.user.dateOfBirth,
                components: .date,
                onValueChanged: {
                    await profileViewModel.saveUserChanges()
                }
            )
            Divider()
            AppFieldWithEditDouble(
                label: "Taille",
                value: $sharedViewModel.user.height,
                unit: "m",
                onValueChanged: {
                    await profileViewModel.saveUserChanges()
                }
            )
        }
    }
}
