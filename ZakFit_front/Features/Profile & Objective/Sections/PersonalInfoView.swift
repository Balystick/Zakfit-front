//
//  PersonalInfoView.swift
//  ZakFit_front
//
//  Created by Aurélien on 12/12/2024.
//

import SwiftUI

struct PersonalInfoView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AppFieldWithEditString(
                label: "Prénom",
                value: $profileViewModel.user.firstName,
                unit: "",
                onValueChanged: {
                    await profileViewModel.saveUserChanges()
                }
            )
            Divider()
            AppFieldWithEditString(
                label: "Nom",
                value: $profileViewModel.user.lastName,
                unit: "",
                onValueChanged: {
                    await profileViewModel.saveUserChanges()
                }
            )
            Divider()
            AppFieldWithEditString(
                label: "Email",
                value: $profileViewModel.user.email,
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
                    EditPasswordView()
                }
            )
            Divider()
            AppMenuPicker(
                label: "Sexe",
                options: profileViewModel.sexeOptions,
                selectedOption: $profileViewModel.user.sexe,
                onValueChanged: {
                    await profileViewModel.saveUserChanges()
                }
            )
            Divider()
            AppDatePicker(
                label: "Date de naissance",
                dateString: $profileViewModel.user.dateOfBirth,
                components: .date,
                onValueChanged: {
                    await profileViewModel.saveUserChanges()
                }
            )
            Divider()
            AppFieldWithEditDouble(
                label: "Taille",
                value: $profileViewModel.user.height,
                unit: "m",
                onValueChanged: {
                    await profileViewModel.saveUserChanges()
                }
            )
        }
    }
}
